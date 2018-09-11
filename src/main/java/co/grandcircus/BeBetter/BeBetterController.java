package co.grandcircus.BeBetter;

import java.io.IOException;
import java.util.List;

import javax.persistence.Id;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.Sentiment;

import co.grandcircus.BeBetter.Entity.Quote;
import co.grandcircus.BeBetter.Entity.Task;
import co.grandcircus.BeBetter.dao.TaskDao;


@Controller
public class BeBetterController {
	
	@Autowired
	TaskDao taskDao;
	
	
	@RequestMapping("/")
	public ModelAndView index()
	{
		ModelAndView mav = new ModelAndView("index");
		
		return mav;	
	}
	
	@RequestMapping("/results")
	public ModelAndView results(@RequestParam("entry")String entry)
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
					
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		//mav.addObject("newScore", newScore);
		return mav;
	}	
	
	@RequestMapping("/user-home")
	public ModelAndView showQuote() {
		ModelAndView mav =  new ModelAndView("user-home");
		
		RestTemplate restTemplate = new RestTemplate();
				
		String url = "http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1";
		
		Quote[] response  = restTemplate.getForObject(url, Quote[].class);
		
		Quote result = response[0];
		mav.addObject("quotes", result);
		
		List<Task>tasks = taskDao.findAll();
		mav.addObject("tasks", tasks);
			
		
		return mav;
	}
	
	@RequestMapping("/user-home/{id}/delete")
	public ModelAndView deleteTask(@PathVariable("id") Long id) {
		taskDao.delete(id);
		return new ModelAndView("redirect:/user-home");
	}

	/*@RequestMapping("/user-home/{id}/update")
	public ModelAndView editTask(Task tasks, Id id) {
	ModelAndView mav = new ModelAndView("user-home");
	
		mav.addObject("tasks", taskDao.findById(Long id));
		mav.addObject("title", "Edit item");

		return mav;
	}*/
	
	@RequestMapping ("/user-home/add-task")
	public ModelAndView addTask(Task task) {
		ModelAndView mav = new ModelAndView("redirect:/user-home");
		mav.addObject(task);
		taskDao.create(task);
		return mav;
	}
}
