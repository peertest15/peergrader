# PeerGrader
PeerGrader is a prototype system for grading online programming assignments. This repo functions both as the code repository for the PeerGrader site itself and as an example assignment that can be used in PeerGrader. PeerGrader is implemented as a Flask application written in Python.

## Project Contents
- .travis.yml: The Travis CI configuration file for the sample homework
- requirements.txt: The pip libraries used by the sample homework
- review.sh: Bash script for creating code reviews in PeerGrader.
- setup.py: Package details for PeerGrader
- sample/: The example homework assignment
  - \_\_init\_\_.py: Python package indicator
  - FreeMono.ttf: Font used in example assignment
  - hw1.py: Example homework assignment
  - hw1_solution.py: Example correct solution for the assignment
  - test_hw1.py: Automated tests for the example homework assignment
  - images/: Images used by the example assignment
- site/: The PeerGrader site itself
  - app.py: PeerGrader Flask application
  - deploy.sh: Deployment helper script
  - requirements.txt: Required pip libraries used by PeerGrader
  - secrets_default.py: Example secrets.py file with no values filled in
  - static/: Bootstrap files
  - templates/: PeerGrader site content in Jinja template format

## Installation
PeerGrader was developed and tested on Ubuntu 14.04. In theory any flavor of Linux could be used though, and relatively minor changes would be needed to port PeerGrader to any platform supported by Flask. The site/ directory contains the full content of PeerGrader and should be copied to a location that is served publicly. No special configuration of Flask is needed. The PeerGrader demo site uses Flask with Gunicorn and Nginx but any web server setup should work. The main configuration needed to setup PeerGrader is in the form of a secrets.py file that should be created in the same directory as PeerGrader's main app.py file. The secrets_default.py file shows the structure of the file and examples of each required value. For the various secret key values, each external tool (GitHub, Gerrit, etc.) should be consulted to find the given key. The deploy.sh file is an optional script for deploying the site, change the content to match your own deployment steps.

## Creating An Assignment
Currently PeerGrader only supports Python programming assignments and tests created with the nose unit testing framework. To create a new assignment, a new public GitHub repo must be created. The root of the repo should include .travis.yml, requirements.txt, and setup.py files similar to the example assignment ones. Any pip packages can be included in requirements.txt and will be installed when Travis CI runs the tests. The structure of the assignment itself is completely up to you, the only requirement is that nose tests are included that are automatically run when "nosetests" is executed. The secrets.py file used by PeerGrader must be updated to include the name of the assignment repo. If the assignment instructions need to be changed, the dashboard.html template can be edited. Those are the only assignment-specific configuration steps, all parts of PeerGrader should work with the new assignment.
