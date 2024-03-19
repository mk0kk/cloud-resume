# Demonstration Video Link
Sorry for the length of the video! (The pipeline took a while to execute)
https://www.youtube.com/watch?v=IZlEshk72bc&list=PLF055ivOg9onBZRUQTzqGdlo5u3B-Hfn0

# What is cloud-resume?

Cloud-resume is a very simple CV website written in Python using Flask framework that I have developed for the requirements of the "Devops Engineering: Software Development Practices and IT Operations" certification of the NKUA university.

# How does the main application work?

In summary, ```app.py``` is a Flask application script that defines a single route ("/") and associates view function (index) to render the ```index.html``` template, when a request is made to the root URL.

When running the ```app.py``` directly, it starts the Flask development server to serve the application.

# How does the testing work?
Testing is done with the ```test_app.py``` file. This file, contains a test class (TestApp) with a single test method (```test_index_page```) that verifies the behavior of the index page of the Flask application.

The ```test_app.py``` file contains unit tests for the application, in a nutshell, it checks for the following:

- Makes a GET request to the application's root URL ("/") and checks if the
  response is "200"

- Checks that specific content in the website (name, occupation, email, phone
  number) is present in the response data

If any of the above assertions fail, the test case will fail, indicating a
potential issue with the application.

# Running "cloud-resume" as a Docker container

Cloud-resume can be ran directly as a container by following the steps below:

1) Access the repository's root directory
   ```BASH
   cd cloud-resume
   ```

2) Create the Docker image
   ```BASH
   sudo docker build -t cloud-resume .
   ```

3) Check that the Docker image has been successfully created
   ```BASH
   sudo docker images
   ```

4) Create the Docker container
   ```BASH
   sudo docker run -p 8080:8080 cloud-resume
   ```
   If you want, you can add the ```-d``` option to run the container in detached mode.

5) Access the application from your browser
   After you have successfully started the container, open the web-browser of your choice and type, in the address bar, the URL ```http://127.0.0.1:8080```

# Deploying cloud-resume on Azure

Cloud-resume runs on Azure cloud, to achieve that, I have followed the steps below:

1) Create an Account on Dockerhub and push the image there (with the tag "latest")

2) Create an Account on MS Azure

3) Set up an Azure App Service (Configure the App Service to be a "Web App" that works with Docker containers, and link it with your Dockerhub image)
  
4) Create an Azure Service Principal and give it the required permissions (so that we can use it for the running of our pipeline)

5) Add the required credentials (Dockerhub, Azure Service Principal) as secrets for Github Actions

6) Create the "azure_deploy" (.github/workflows/azure_deploy.yml) pipeline, where the 3 steps (Test, Build, Deploy) are running. This allows us to push directly to productions if all the jobs have ran successfully (one job cannot start if the previous one has failed).
