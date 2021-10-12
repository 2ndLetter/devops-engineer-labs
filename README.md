# devops-engineer-labs

## create-iam.sh Usage and Example:

> This script is used to create an IAM Group/Policy/User, CodeCommit SSH Keys, and Validate Connection
* Usage: `./create-iam.sh <name_of_user>`
* Example:  `./create-iam.sh John`

---

## create-codecommit-repo.sh Usage and Example:

> This script is used to create a codecommit repository, git clone repo, copy lab to repo directory, push changes
* Usage: `./create-codecommit-repo.sh <name_of_repo>`
* Example:  `./create-codecommit-repo.sh my-webpage`

---

## delete-codecommit-repo.sh Usage and Example:

> This script is used to delete a codecommit repository, local repo cleanup
* Usage/example: `./delete-codecommit-repo.sh <name_of_repo>`
* Example:  `./delete-codecommit-repo.sh my-webpage`

---

## delete-iam.sh Usage and Example:

> This script is used to delete an IAM CodeCommit public key and IAM User/Policy/Group
* Usage: `./delete-iam.sh <name_of_user>`
* Example:  `./delete-iam.sh John`