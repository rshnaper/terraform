This project demonstrates the ability to use terraform in DRY fashion by externalizing only the backend configuration and inputs. This is done by using a wrapper shell script that re-initializes terraform when switching environments.