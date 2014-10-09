Agile Software Factory
======================

Install common components of CI/CD infrastructure and setup integration between them.

Getting Started
---------------

Agile Software Factory is the foundation for an efficient, scalable, and reliable development and release process. By modeling processes after a conveyor belt or pipeline, ASF gives structure to your software development process. This allows engineering teams to focus on implementing functionality instead of fighting with operational issues.

Components
----------
- **Jenkins** - CI server. Build and verify code from Gerrit and notify developers by posing status into relevant JIRA tasks and sending email notifications, run functional and integration tests and deploy artifacts into Nexus.
- **Gerrit + Gitweb** - Code review tool and also git repository browser. Uses for managing code, projects and developers permissions.
- **LDAP** - OpenLDAP installation for centralized storing information about developers accounts and authorization on other components.
- **JIRA** - Project tracking software, which aggregates information about tasks status for other components and tracks all developer activities.
- **Nexus** - artifact repository, stores successfully built artifacts from Jenkins.
- **Sonar** - collects and analyze code metrics.
 
Structure
---------
- **cookbooks** - contain cicd_infractructure cookbook - main cookbook for installing components and run integration.
- **manifests** - contain manifest for main Qubell application, templates and manifests for dependencies.
-  **manifests/templates** - contain manifest template for main Qubell application
-  **manifests/components** - contain Qubell manifests for dependencies for main application
-  **Rakefile** - set of rake tasks to simplify common operations.
-  **config.json** - configuration file for Rakefile, contains information about preferred s3 buckets and components for generation main manifest from template.
-  **meta.yaml** - Qubell component metadata file.

Manifests
---------
- **main.yaml** - main Qubell manifest with all components enabled. Run dependent components and setup integration.
- **components/gerrit.yaml** - install Gerrit
- **components/jenkins.yaml** - install Jenkins
- **components/jira.yaml** - install JIRA
- **components/ldap.yaml** - install LDAP
- **components/nexus.yaml** - install Nexus
- **components/sonar.yaml** - install Sonar

Cookbook recipes
----------------
- **gerrit.rb** - install gerrit 2.9 and setup root user for it (accessible only via CLI)
- **integration_gerrit_demojobs_project.rb** - create project with jenkins jobs templates
- **integration_gerrit_jenkins.rb** - create Non-Interactive user for jenkins based on passed public ssh key
- **integration_gerrit_ldap.rb** - regenerate Gerrit config with ldap section.
- **integration_gerrit_projects.rb** - set permissions for All-Projects and create new two project templates: Open-Projects and Private-Projects in Gerrit
- **integration_jenkins_description.rb** - Add the endpoint to other services in Jenkins
- **integration_jenkins_gerrit.rb** - generate ssh key and pass it to Gerrit, setup Jenkins gerrit-trigger plugin
- **integration_jenkins_jira.rb** - setup Jenkins jira plugin
- **integration_jenkins_jobs.rb** - put jobs templates into Gerrit repository and add job for checkout and job generation in Jenkins
- **integration_jenkins_ldap.rb** - setup Jenkins LDAP plugin
- **integration_jenkins_nexus.rb** - add NEXUS_URL variable to Jenkins, setup access with maven-global-settings
- **integration_jenkins_qubell.rb** - setup Jenkins Qubell plugin.
- **integration_jenkins_selenium.rb** - add SELENIUM_URL variable to Jenkins
- **integration_jira_jenkins.rb** - enables remote API call in JIRA
- **integration_jira_ldap.rb** - add LDAP configuration to JIRA database
- **integration_nexus_ldap.rb** - setup LDAP config and groups mapping in Nexus
- **integration_sonar_ldap.rb** - setup LDAP in Sonar
- **jenkins.rb** - install Jenkins and plugins for itAdd
- **jira.rb** - install JIRA
- **nexus.rb** - install Nexus and setup repositories
- **openldap.rb** - install OpenLDAP and init root directory
- **openldap_init_root.rb** - setup initial LDAP structure
- **openldap_new_users.rb** - add users into LDAP
- **sonar.rb** - install Sonar
- **zephyr.rb** - install Zephyr

Develop
-------
- Setup rbenv/rvm to use Ruby 1.9.3 by default
- Run `bundle install` to get all dependences
- To verify cookbook syntax and code style run `bundle exec rake` in `cookbooks/cicd_infrastructure`
- To get all cookbook dependences run `bundle exec berks install
- To get local copy of Berkshelf repo run `berks vendor cookbooks`
- To setup dev installation of cookbook run `vagrant up`

To get more Vargant images look at [bento](https://github.com/opscode/bento)


License and Authors
-------------------
Authors: TODO: List authors
