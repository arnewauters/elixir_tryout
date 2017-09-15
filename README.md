# NephroFlow 2

## Getting Started

This is the top level umbrella application. It can be used to easily run tests
of the entire suite, compile the entire suit etc.

The projects under the apps directory are just that, regular mix projects.
A mix.exs file in a project can expose the following public functions:

- `project/0` which returns the project configuration.
- `application/0` used to build the application file.

Whilst project dependencies may have OTP applications defined that in turn can
be given as dependencies in the `application/0` callback there is a clear
distinction between the libraries your project depends on and the OTP
applications the application your project defines depends on (if any).

## Project motivation

NephroFlow 2 is a rewrite of the NephroFlow suite.

The main drivers for a rewrite are:

- to naturally enforce a better solution architecture for the suite by embracing
the idioms of the Elixir language and the OTP framework.

- to isolate the domain and business layer from the service layer(s).

- to reduce the hard dependency on a particular framework.

- to facilitate certain functionalities as a result of a CQRS with
event-sourcing solution architecture.

- to reduce the error surface by writing less and more succint code.
