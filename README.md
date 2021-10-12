# devops-engineer-labs

## create-user.sh Usage and Example:

> This script is used to create an IAM Group/Policy/User, CodeCommit SSH Keys, and Validate Connection
* Usage: `./create-user.sh <name_of_user>`
* Example:  `./create-user.sh John`

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

## delete-user.sh Usage and Example:

> This script is used to delete an IAM CodeCommit public key and IAM User/Policy/Group
* Usage: `./delete-user.sh <name_of_user>`
* Example:  `./delete-user.sh John`