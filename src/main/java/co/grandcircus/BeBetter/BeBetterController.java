package co.grandcircus.BeBetter;

import com.google.cloud.language.v1.LanguageServiceClient;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.Sentiment;

@Controller
public class BeBetterController {
	
	
	@RequestMapping("/")
	public ModelAndView index()
	{
		ModelAndView mav = new ModelAndView("index");
		
		// Instantiates a client
		LanguageServiceClient language;
		try {
			language = LanguageServiceClient.create();
			
			// The text to analyze
			String[] texts = {"I love this!", "I hate this!"};
			for (String text : texts)
			{
			  Document doc = Document.newBuilder().setContent(text).setType(Type.PLAIN_TEXT).build();
			  // Detects the sentiment of the text
			  Sentiment sentiment = language.analyzeSentiment(doc).getDocumentSentiment();

			  System.out.printf("Text: \"%s\"%n", text);
			  System.out.printf(
			      "Sentiment: score = %s, magnitude = %s%n",
			      sentiment.getScore(), sentiment.getMagnitude());
			  mav.addObject("score", sentiment.getScore());
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
		//mav.addObject("entry", entry);
		return mav;
	}	

}
