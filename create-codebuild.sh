#!/bin/bash -ex

# Create build project
aws codebuild create-project --cli-input-json file://codebuild-project.json

# CodeBuild start build
aws codebuild start-build --project-name "CodeBuildDemo"
