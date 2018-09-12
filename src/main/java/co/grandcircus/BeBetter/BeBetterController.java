package co.grandcircus.BeBetter;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import co.grandcircus.BeBetter.Entity.Quote;
import co.grandcircus.BeBetter.Entity.Score;
import co.grandcircus.BeBetter.Entity.Task;
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
				// adds score to the sessions
				session.setAttribute("score", sentiment.getScore());
				System.out.println("Session" + session.getAttribute("score"));
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		//mav.addObject("newScore", newScore);
		return mav;
	}	
	//makes the quote api do the thing
	@RequestMapping("/user-home")
	public ModelAndView showQuote(HttpSession session,
			@SessionAttribute(name="user") User user) {
		ModelAndView mav =  new ModelAndView("user-home");
		
		RestTemplate restTemplate = new RestTemplate();
				
		String url = "http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1";
		
		Quote[] response  = restTemplate.getForObject(url, Quote[].class);
		
		Quote result = response[0];
		mav.addObject("quotes", result);
		
		
		//List<Task> tasks = taskDao.findAll();
		List<Task> tasks = taskDao.findByUser(user);
		System.out.println("test for find all");
		
		//remove item from list if complete
		for(Iterator<Task> temp = tasks.listIterator(); temp.hasNext();){
		    Task s = temp.next();
		    if(s.isComplete()){
		        tasks.remove(s);   
		    }
		} 

		mav.addObject("tasks", tasks);
		
		session.getAttribute("score");		
		return mav;
	}
	//delete a task
	@RequestMapping("/user-home/{id}/delete")
	public ModelAndView deleteTask(@PathVariable("id") Long id) {
		taskDao.delete(id);
		return new ModelAndView("redirect:/user-home");
	}
	//editing a task
	/*@RequestMapping("/user-home/{id}/update")
	public ModelAndView editTask(Task tasks, Id id) {
	ModelAndView mav = new ModelAndView("user-home");
	
		mav.addObject("tasks", taskDao.findById(Long id));
		mav.addObject("title", "Edit item");

		return mav;
	}*/
	//adding a task
	@RequestMapping ("/user-home/add-task")
	public ModelAndView addTask(HttpSession session, Task task, @SessionAttribute(name="user") User user) {
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
	
	public static void getCurrentTimeUsingDate(HttpSession session) {
	    Date date = new Date();
	    String strDateFormat = "yyyy-MM-dd";
	    DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
	    String formattedDate= dateFormat.format(date);
	    session.setAttribute("date", formattedDate);
	    System.out.println("Current time of the day using Date - 12 hour format: " + formattedDate);
	}
	
	//getting score from session and adding it to the database
	@RequestMapping("/user-home/submit-result")
	public ModelAndView submitResult(HttpSession session,
			@SessionAttribute(name="user") User user) {
		
		ModelAndView mav =  new ModelAndView("redirect:/user-home");
		
		String date = (String) session.getAttribute("date");
		Float score = (Float) session.getAttribute("score");
		
		Score newScore = new Score(null, user, score, date);
		scoreDao.create(newScore);
		
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
		try {
			session.setAttribute("user", user);
			userDao.create(user);
		}
		catch(Exception e) {
			redir.addFlashAttribute("message", "User with email already exists!");
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
				//No match
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
		redir.addFlashAttribute("meassage", "Logged out.");
		return new ModelAndView("redirect:/");
	}
}
