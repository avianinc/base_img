FROM condaforge/mambaforge
#FROM continuumio/miniconda3

## Must add `DEBIAN_FRONTEND=noninteractive` to prevent any os waiting for user input situations
  ## see --> https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ARG DEBIAN_FRONTEND=noninteractive

## wget is used to retrieve Conda and SysML Release. 
## Inkscape and LaTeX is required for rendering notebooks as PDFs.
## Scilab & Octive for fun :)
RUN apt-get --quiet --yes update
RUN apt-get -y upgrade
RUN apt-get install -yqq --no-install-recommends \
  wget                        \
  build-essential             \
  octave                      \
  scilab      

## Clean up a bit to keep the image small
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

#CMD python -m ipykernel_launcher -f $DOCKERNEL_CONNECTION_FILE

# Used for trouble shooting
CMD ["/bin/bash"]