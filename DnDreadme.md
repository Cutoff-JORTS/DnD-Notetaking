#READ_ME_PLZ

Welcome, weary traveler! Place your pack down by the fire and grab a bowl of stew, this place has tools to help you organize and review your notes and archives of your adventures (both past and present). Please find all you need inside:

This repo contains a few scripts that I use to manage notes for my ongoing campaigns, and two particularly useful search tools to find relevant content inside of them on-demand. Both the 'restfinder' and 'tipofmytongue' scripts leverage a specific directory heirarchy, which 'newgame' establishes based on user input.

While this script is tailored to my specfic "production" need, it can be altered/adapted towards other ends. 
	- 'newgame' creates a uniform directory heirarchy based on user-input prompts (with failsafes to cehck for existing directories under same name).
	- 'restfinder' searches the text files within a specified archive for a pre-determined string, and outputs the results to a log file
	- 'tipofmytongue' prompts the user for a specific directory within a pre-determined location, then searches the directory for any number of user-input strings. It outputs the search results to a log file, separating the results for each individual search term. Currently, there is no upper limit for search terms.
	
The output text to the terminal for these is, for the most part, cosmetic and tailored towards the original use case: organizing notes for several years' worth of TTRPG notes.

If you are reading this far, thank you and I hope these are useful to you somehow. Please send any suggestions/feedback to jorts.tech@gmail.com