#Code to convert the bibliography from bib to json
#!!! Just check the name of the bib file
# Preamble
rm(list = ls(l)); setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Execute in a new terminal
NewTerminal=rstudioapi::terminalCreate(show=FALSE)
Sys.sleep(0.1)
if (rstudioapi::terminalRunning(NewTerminal)){
  rstudioapi::terminalSend(NewTerminal, 'PATH="/usr/lib/rstudio-server/bin/pandoc/:${PATH}" \n')
  rstudioapi::terminalSend(NewTerminal, "export LANG=en_US.UTF-8 \n")
  Sys.sleep(0.5)
  rstudioapi::terminalSend(NewTerminal, "pandoc-citeproc --bib2json biblio.bib > biblio.json \n")
}
Sys.sleep(0.5)
rstudioapi::terminalKill(NewTerminal)
Sys.sleep(0.5)
if(!rstudioapi::terminalRunning(NewTerminal)){print("!---Bibliography converted---!")}
# FIN
