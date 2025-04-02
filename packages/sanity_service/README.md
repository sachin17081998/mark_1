# SanityService

SanityService is a Flutter/Dart utility package designed to interact with the Sanity.io content platform. It simplifies fetching documents from Sanity and parsing them into Dart models while ensuring secure and reusable API access. The package supports both single-document and multi-document queries with flexible parsing.

# Features

Singleton Pattern: Ensures only one instance of the service is used throughout the app.

Secure Initialization: API credentials and configuration are securely passed during initialization.

Generic Model Parsing: Fetch data and automatically parse it into Dart models.

Two Fetch Modes:

- Fetch a single document.

- Fetch a list of documents.

