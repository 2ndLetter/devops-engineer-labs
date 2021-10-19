# devops-engineer-labs

> Currently builds out lab through video #33

## spinup.sh and spindown.sh Usage and Example:
> Two scripts created to quickly build and destroy the lab (via running the below sections)
* Usage: `./spinup.sh <name_of_user> <name_of_repo>`
    * Example: `./spinup.sh John my-webpage`
* Usage: `./spindown.sh <name_of_user> <name_of_repo>`
    * Example: `./spindown.sh John my-webpage`

---
---
# only do the below for more finegrained control
> I'll update the info below once this project is complete, as I'm making changes quickly at the moment
---
---

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