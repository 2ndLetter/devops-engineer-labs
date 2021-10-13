#!/bin/bash

# Create build project
aws codebuild create-project --cli-input-json file://create-project.json

# Start build