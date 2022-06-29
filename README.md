welcome to the the vetapp codebase
# What is VetApp?
  VetApp is the first part of a two part app that manages pet appointments with vets

# Table of contents


# Getting started

## Installation Prerequisites

### Ruby
This project runs on `ruby 2.7.2`

If you don't already have a ruby version manager , I recommend `asdf`, you should install one to be able to switch versions on a project to project basis  

### Rails

This project runs on `Rails 7.0.3`

Tis can be installed as per normal with `gem` 


### Postgresql
 This project runs on `Postgresql 14.3`

 refer to the deployment instructions for further info

# Deployment instructions
# Mac osx

## Postgresql
  1. run `createuser -P -d vetapp` and when promted add vetapp as the password
  2. run 'echo `export vetapp_DATABASE_PASSWORD="vetapp"' >> ~/.zshrc`
  3. run `source ~/.zshrc`
