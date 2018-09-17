package co.grandcircus.BeBetter;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.Sentiment;

import co.grandcircus.BeBetter.Entity.Affirmation;
import co.grandcircus.BeBetter.Entity.Quote;
import co.grandcircus.BeBetter.Entity.Score;
import co.grandcircus.BeBetter.Entity.Task;
import co.grandcircus.BeBetter.dao.AffirmationDao;
import co.grandcircus.BeBetter.dao.QuoteDao;
import co.grandcircus.BeBetter.dao.ScoreDao;
import co.grandcircus.BeBetter.dao.TaskDao;
import co.grandcircus.BeBetter.dao.UserDao;
import co.grandcircus.BeBetter.Entity.User;


@Controller
public class BeBetterController {
	
	@Autowired
	TaskDao taskDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ScoreDao scoreDao;
	@Autowired
	QuoteDao quoteDao;
	@Autowired
	AffirmationDao affirmationDao;
	
	@RequestMapping("/")
	public ModelAndView index(HttpSession session)
	{
		ModelAndView mav = new ModelAndView("index");
		getCurrentTimeUsingDate(session);
		return mav;	
	}
	//this makes mood api do its thing, converting text entered on index page into a number on results page.
	@RequestMapping("/results")
	public ModelAndView results(HttpSession session, @RequestParam("entry")String entry)
	{
		ModelAndView mav = new ModelAndView("results");
		// Instantiates a client
			LanguageServiceClient language;
			try {
				language = LanguageServiceClient.create();
					
				// The text to analyze
				String text = entry;
					
				Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();
				// Detects the sentiment of the text
				Sentiment sentiment = language.analyzeSentiment(doc).getDocumentSentiment();

				System.out.printf("Text: \"%s\"%n", text);
				System.out.printf(
				"Sentiment: score = %s, magnitude = %s%n",
				sentiment.getScore(), sentiment.getMagnitude());
				mav.addObject("entry", sentiment.getScore());
				// adds score and text to the sessions
				session.setAttribute("text", entry);
				
				//Puts score into a range from 0 to 100
				Double OldRange = (double) (1 - (-1));
				Double	NewRange = (double) (100 - 0);
				Double	NewValue = (((sentiment.getScore() - (-1)) * NewRange) / OldRange) + 0;
				int roundedScore = (int) Math.floor(NewValue);
				
				session.setAttribute("score", roundedScore);
				//System.out.println("Session" + session.getAttribute("score"));
				//System.out.println(roundedScore);	
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		//mav.addObject("newScore", newScore);
		return mav;
	}	
	
	
	//Quote API call
	@RequestMapping("/user-home")
	public ModelAndView userHome(HttpSession session,
			@SessionAttribute(name="user") User user,
			@SessionAttribute(name="date") String date) {
		ModelAndView mav =  new ModelAndView("user-home");
		
		RestTemplate restTemplate = new RestTemplate();
		
		String url = "https://talaikis.com/api/quotes/random";
		
		Quote response  = restTemplate.getForObject(url, Quote.class);
		
		Quote result = response;
		mav.addObject("quotes", result);
		
		System.out.println(result);
		 
		//mood tracker things
		List<Score> scores = scoreDao.findByUser(user);
		mav.addObject("moodScore", scores);
		
		List<Task> tasks = taskDao.findByUser(user);
		System.out.println("test for find all");
		
		//remove item from list if complete
		Iterator<Task> it = tasks.iterator();
		while (it.hasNext()) {
		    Task thisTask = it.next();
		    if (thisTask.isComplete()) {
		        it.remove();
		    }
		}
			
		mav.addObject("tasks", tasks);
		System.out.println(tasks);
		
		//Affirmation affirmation = affirmationDao.findLast(user);
		//mav.addObject("affirmation", affirmation);

		// this runs the Dao to find the last affirmation written/ if there in not one it returns empty string
		String lastAff = affirmationDao.findLast(user);
		System.out.println("lastAff Dao runs");
		mav.addObject("affirmation", lastAff);
		
		return mav;
	}
	
	//delete a task
	@RequestMapping("/user-home/{id}/delete")
	public ModelAndView deleteTask(@PathVariable("id") Long id) {
		taskDao.delete(id);
		return new ModelAndView("redirect:/user-home");
	}
	
	//quote-list page
	@RequestMapping("/quote-list")
	public ModelAndView viewQuotes(HttpSession session,
			@SessionAttribute(name="user") User user) {
		ModelAndView mav = new ModelAndView("quote-list");
		List<Quote> quotes = quoteDao.findByUser(user);
		mav.addObject("quoteResult", quotes);
		return mav;
	}
	
	//add quote to the database
	@RequestMapping ("/user-home/add-quote")
	public ModelAndView addQuote(HttpSession session, 
			@RequestParam("quote") String quote, @RequestParam("author") String author,
			@SessionAttribute(name="user") User user) {
		ModelAndView mav = new ModelAndView("redirect:/user-home");
	
		//then adds the quote (with userId) to the database
		Quote newQuote = new Quote(null, quote, author, user);
		
		quoteDao.create(newQuote);
		return mav;
	}
	
	//delete quote from the quote-list page
	@RequestMapping("/quote-list/{id}/delete")
	public ModelAndView deleteQuote(@PathVariable("id") Long id) {
		quoteDao.delete(id);
		return new ModelAndView("redirect:/quote-list");
	}

	//adding a affirmation
	@RequestMapping ("/user-home/add-affirmation")
	public ModelAndView addAffirmation(HttpSession session, Affirmation affirmation, 
				@SessionAttribute(name="user") User user) {
			ModelAndView mav = new ModelAndView("redirect:/user-home");
			
			//gets user info from the sessions and adds to the affirmation
			affirmation.setUser(user);
			mav.addObject(affirmation);
			
			//then adds the affirmation (with userId) to the database
			affirmationDao.create(affirmation);
			
			return mav;
		}
		

	//List all affirmations
	@RequestMapping ("/affirmation")
	public ModelAndView addTask(HttpSession session, Affirmation affirmation,
			@SessionAttribute(name="user") User user) {
		ModelAndView mav = new ModelAndView("affirmation");

		List<Affirmation> allAffirmations = affirmationDao.findByUser(user);
		
		mav.addObject("allAffirmations",allAffirmations);
		return mav;
	}
		
	//adding a affirmation to affirmation jsp
	@RequestMapping ("/affirmation/add-affirmation")
	public ModelAndView addAffirmationJsp(HttpSession session, Affirmation affirmation, 
			@SessionAttribute(name="user") User user) {
		ModelAndView mav = new ModelAndView("redirect:/affirmation");
		
		//gets user info from the sessions and adds to the affirmation
		affirmation.setUser(user);
		mav.addObject(affirmation);
		
		//then adds the affirmation (with userId) to the database
		affirmationDao.create(affirmation);
		
		return mav;
	}
	
	//delete an affirmation
	@RequestMapping("/affirmation/{id}/delete")
	public ModelAndView deleteAffirmation(@PathVariable("id") Long id) {
		affirmationDao.delete(id);
		return new ModelAndView("redirect:/affirmation");
	}

	//adding a task
	@RequestMapping ("/user-home/add-task")
	public ModelAndView addTask(HttpSession session, Task task, 
			@SessionAttribute(name="user") User user) {
		ModelAndView mav = new ModelAndView("redirect:/user-home");
		
		//gets user info from the sessions and adds to the task
		task.setUser(user);
		mav.addObject(task);
		
		//then adds the task (with userId) to the database
		taskDao.create(task);
		
		return mav;
	}
	
	//updating task to complete
	@RequestMapping ("/user-home/{id}/complete-task")
	public ModelAndView completeTask(HttpSession session, 
			@PathVariable("id") Long id, 
			@RequestParam("complete") Boolean complete) {
		ModelAndView mav = new ModelAndView("redirect:/user-home");
		System.out.println("hello");
		//sends update to database
		String date = (String) session.getAttribute("date");
		taskDao.complete(id, complete, date);
		//adds completed date to the database
		System.out.println("Date is " + date);
		return mav;
	}
	
	//pulls the date from the url and saves it to the session for use at any later need
	public static void getCurrentTimeUsingDate(HttpSession session) {
	    Date date = new Date();
	    String strDateFormat = "yyyy-MM-dd";
	    DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
	    String formattedDate= dateFormat.format(date);
	    session.setAttribute("date", formattedDate);
	    System.out.println("Current time of the day using Date - 12 hour format: " + formattedDate);
	}
	
	//getting score from session and adding it to the database, from result page
	@RequestMapping("/user-home/submit-result")
	public ModelAndView submitResult(HttpSession session,
			@RequestParam("newScore") Float newScore)
	{
		//updates score in session with new score
		session.setAttribute("score", newScore);
	
		ModelAndView mav = new ModelAndView("redirect:/login-reg");
		return mav;
		
	}
	
	//after getting score from session and
	//adding it to the database, from result page
	//user MUST login/register
	@RequestMapping("/login-reg")
	public ModelAndView signInt() {
		
		ModelAndView mav =  new ModelAndView("/login-reg");
		
		return mav;
	}
	
	//new login with score
	@RequestMapping("/login-score")
	public ModelAndView loginScore(HttpSession session,
			User createUser, 
			RedirectAttributes redir,
			@RequestParam("email") String email, 
			@RequestParam("password") String password) {
		
		ModelAndView mav =  new ModelAndView("/login-score");

		//add user to database
		try { 
			User user = userDao.findByEmail(email);
			if (user != null && password.equals(user.getPassword())) {
				
				//Match!
				session.setAttribute("user",  user);
				
				//Create a score for this user
				String date = (String) session.getAttribute("date");
				int score = (int) session.getAttribute("score");
				String text = (String) session.getAttribute("text");

				
				Score newScore = new Score(null, user, score, date, text);
				scoreDao.create(newScore);
				
				return new ModelAndView("redirect:/user-home");
			}
			else if(user != null && !password.equals(user.getPassword()))
			{
				redir.addFlashAttribute("message", "User doesn't exist!");
			}
			else
			{
				//No match, return to index page
		
				mav.addObject("message", "Wrong email or password.");		
				return mav = new ModelAndView("redirect:/login-reg");
	
			}
		}
		catch(NoResultException e)
		{
			redir.addFlashAttribute("message", "No entity found for query!");
		}
		catch(Exception e)
		{
			redir.addFlashAttribute("message", "Error has occurred!");
		}
		
		return new ModelAndView("redirect:/user-home");
				
	}
	
	//new reg with score
	@PostMapping("/register-score")
	public ModelAndView regScore(User user, 
			HttpSession session, 
			RedirectAttributes redir,
			@RequestParam("email") String email, 
			@RequestParam("password") String password) {
		
		// Save the user information to the session.
		try {
			
			//checks for user
			user = userDao.findByEmail(email);
					
			if(user != null) {
				
				//User with email exists, return to index page
				ModelAndView mav = new ModelAndView("redirect:/login-reg");

				redir.addFlashAttribute("message", "User with email already exists!");
				
				return mav;
			}
			else
			{
				//add user to session and to database
				session.setAttribute("user", user);
				userDao.create(user);
				
				//Create a score for this user
				String date = (String) session.getAttribute("date");
				int score = (int) session.getAttribute("score");
				String text = (String) session.getAttribute("text");

				
				Score newScore = new Score(null, user, score, date, text);
				scoreDao.create(newScore);
			}
			
		}
		catch(EmptyResultDataAccessException e)
		{
			//add user to session and to database
			session.setAttribute("user", user);
			userDao.create(user);
			
			//Create a score for this user
			String date = (String) session.getAttribute("date");
			int score = (int) session.getAttribute("score");
			String text = (String) session.getAttribute("text");

			
			Score newScore = new Score(null, user, score, date, text);
			scoreDao.create(newScore);
		}
		catch(Exception e) {
			
			e.printStackTrace();
			//User with email exists, return to index page
			ModelAndView mav = new ModelAndView("redirect:/login-reg");

			redir.addFlashAttribute("message", "Error or user with email already exists!");
			
			return mav;
		}
		
		ModelAndView mav = new ModelAndView("redirect:/user-home");
		return mav;
	}
	
	@PostMapping("/register-submit")
	public ModelAndView submitEditProfile(User user, 
			HttpSession session, 
			RedirectAttributes redir,
			@RequestParam("email") String email, 
			@RequestParam("password") String password) {
		
		// Save the user information to the session.
		System.out.println(user);
		// creates new user so won't turn null after checking against email.
		User newUser = user;
		//checks for user
		user = userDao.findByEmail(email);
//		boolean userAlreadyExists = (user != null);
				
		if(user != null) {
			
			//User with email exists, return to index page
			ModelAndView mav = new ModelAndView("redirect:/");

			redir.addFlashAttribute("message", "User with email already exists!");
			
			return mav;
		}
		else
		{
			//add user to session and to database
			session.setAttribute("user", newUser);
			userDao.create(newUser);
		}
			
		ModelAndView mav = new ModelAndView("redirect:/user-home");
		return mav;
	}
	
	@PostMapping("/login-submit")
	// get the username and password from the form when it's submitted.
	public ModelAndView submitLoginForm(HttpSession session, 
			@RequestParam("email") String email, 
			@RequestParam("password") String password,
			RedirectAttributes redir) {
		try { 
			User user = userDao.findByEmail(email);
			if (user != null && password.equals(user.getPassword())) {
				//Match!
				session.setAttribute("user",  user);
				return new ModelAndView("redirect:/user-home");
	
			}
			else if(user != null && !password.equals(user.getPassword()))
			{
				redir.addFlashAttribute("message", "User doesn't exist!");
			}
			else
			{
				//No match, return to index page
				
				ModelAndView mav = new ModelAndView("redirect:/");
				mav.addObject("message", "Wrong email or password.");
				
				return mav;
	
			}
		}
		catch(NoResultException e)
		{
			redir.addFlashAttribute("message", "No entity found for query!");
		}
		catch(Exception e)
		{
			redir.addFlashAttribute("message", "Error has occurred!");
		}
		
		return new ModelAndView("redirect:/");
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes redir) {
		
		session.invalidate();
		redir.addFlashAttribute("message", "Logged out.");
		return new ModelAndView("redirect:/");
	}
	
	//Detailed list of submitted entries 
	@RequestMapping("/moodDetails")
	public ModelAndView moodDetails(HttpSession session)
	{
		ModelAndView mav = new ModelAndView("moodDetails");
		
		//mood tracker tings
		/*User user = new User(null, );
		List<Score> scores = scoreDao.findByUser(user);
		mav.addObject("moodScore", scores);*/
		
		/*List<Score> testing = new ArrayList<Score>();

	    testing.add(new Score(null, null, (float)-0.9, "2018/14/9"));
	    testing.add(new Score(null, null, (float)-.7, "2018/14/9"));
	    testing.add(new Score(null, null, (float)-.5, "2018/14/9"));
	    testing.add(new Score(null, null, (float)-.3, "2018/14/9"));
	    testing.add(new Score(null, null, (float)-.1, "2018/14/9"));
	    testing.add(new Score(null, null, (float)0.0, "2018/14/9"));
	    testing.add(new Score(null, null, (float).1, "2018/14/9"));
	    testing.add(new Score(null, null, (float).3, "2018/14/9"));
	    testing.add(new Score(null, null, (float).5, "2018/14/9"));
	    testing.add(new Score(null, null, (float).7, "2018/14/9"));
	    testing.add(new Score(null, null, (float).9, "2018/14/9"));
	    testing.add(new Score(null, null, (float)1.0, "2018/14/9"));*/
	    
		List<Double> testing = new ArrayList<Double>();

		testing.add(-.9);
	    testing.add(-.7);
	    testing.add(-.5);
	    testing.add(-.3);
	    testing.add(-.1);
	    testing.add(0.0);
	    testing.add(.1);
	    testing.add(.3);
	    testing.add(.5);
	    testing.add(.7);
	    testing.add(.9);
	    testing.add(1.0);

	    
	    
		System.out.println(testing);
	    mav.addObject("testing", testing);
	    
	    List<Score> moodList = new ArrayList<Score>();

	    moodList.add(new Score(null, null, (int) 29, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 47, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 55, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 93, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 31, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 0, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 71, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 93, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 100, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 89, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 99, "2018/14/9", "Great! Ugh."));
	    moodList.add(new Score(null, null, (int) 1, "2018/14/9", "Great! Ugh."));
	    
	    mav.addObject("moodList", moodList);


		return mav;	
	}
	
	//For the submission of a mood on the moodDetails page
	@RequestMapping("/moodDetailsSubmit")
	public ModelAndView moodSubmit(HttpSession session,
			RedirectAttributes redir,
			@RequestParam("entry") String entry) {
		
		ModelAndView mav =  new ModelAndView("/moodDetailsSubmit");
		
		//Grades new entry
		// Instantiates a client
		LanguageServiceClient language;
		try {
			language = LanguageServiceClient.create();
				
			// The text to analyze
			String text = entry;
				
			Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();
			// Detects the sentiment of the text
			Sentiment sentiment = language.analyzeSentiment(doc).getDocumentSentiment();

			System.out.printf("Text: \"%s\"%n", text);
			System.out.printf(
			"Sentiment: score = %s, magnitude = %s%n",
			sentiment.getScore(), sentiment.getMagnitude());
			mav.addObject("entry", sentiment.getScore());
			
			//Puts score into a range from 0 to 100
			Double OldRange = (double) (1 - (-1));
			Double	NewRange = (double) (100 - 0);
			Double	NewValue = (((sentiment.getScore() - (-1)) * NewRange) / OldRange) + 0;
			int roundedScore = (int) Math.floor(NewValue);
						
			// grabs user information and creates a new score
			String date = (String) session.getAttribute("date");
			
			Score newScore = new Score(null, (User) session.getAttribute("user"), roundedScore, date, text);
			scoreDao.create(newScore);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return new ModelAndView("redirect:/moodDetails");
	}
	
}
