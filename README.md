# InBank Frontend

This project is a frontend application for the InBank loan application service.
It is built using Flutter and communicates with the backend API to
display loan options and handle loan applications.

## Technologies Used
- Flutter
- Dart

## Requirements
- Flutter

## Installation
To install and run the application, please follow these steps:

1. Clone the repository.
2. Navigate to the root directory of the project.
3. Run `flutter pub get` to install the required dependencies.
4. Run `flutter run` to start the application in debug mode.

## Functionality
The InBank Frontend application provides a form for submitting loan applications.
The form consists of two sliders for selecting the loan amount and loan period,
and a text field for entering the national ID number.
The application communicates with the backend API to calculate the approved
loan amount and loan period, which are displayed to the user.

## Components
The application consists of the following main components:

### LoanForm
The LoanForm component displays the loan application form,
including the sliders for selecting the loan amount and loan period
and the text field for entering the national ID number.
It communicates with the backend API to calculate the approved loan amount
and loan period based on the form inputs.

### ApiService
The ApiService component provides methods for making API calls to the backend API.
It sends loan application information to the backend API and receives a response
with the approved loan amount and loan period.

## Contributors
This frontend application was developed by Jürgen Tihanov as a part of the application
for an InBank software developer internship.
