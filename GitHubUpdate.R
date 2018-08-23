CommitMessage <- paste("updated on ", Sys.time(), sep = "")
wd <- getwd()
gitCommand <- paste("cd ", wd, " \n git add . \n git commit --message '", CommitMessage, "' \n git push origin master \n", sep = "")
system(command = gitCommand, intern = TRUE)


library(rtweet)

# create_token(
#     app = "",
#     consumer_key = "",
#     consumer_secret = "")


post_tweet("The Upcoming Issue of the Pancreatobiliary Pathology Journal List has been updated: http://pbpath.org/journal-watch-upcoming-issue/  The Current Issue is here: http://pbpath.org/journal-watch/  #PBPath #GIPath #pathology #pathologists")
