CommitMessage <- paste("updated on ", Sys.time(), sep = "")
wd <- getwd()
gitCommand <- paste("cd ", wd, " \n git add . \n git commit --message '", CommitMessage, "' \n git push origin master \n", sep = "")
system(command = gitCommand, intern = TRUE)


library(rtweet)

# create_token(
#     app = "",
#     consumer_key = "",
#     consumer_secret = "")

UpdateTweet <- paste0("Draft (upcoming) PBPath Journal Watch: http://pbpath.org/journal-watch-upcoming-issue/ is updated on ", Sys.Date() ,". You can read the Current Issue here: http://pbpath.org/journal-watch/   #PBPath #GIPath #pathology #pathologists #pancreas #pancpath #HPBpath #PanCan #PancreaticCancer #PancSM #pancreatitis #hpbcsm")

post_tweet(UpdateTweet)




UpdateTweet2 <- "New articles published on pancreas and biliary pathology. Check them here: http://pbpath.org/journal-watch-upcoming-issue/ #PBPath #GIPath #pathology #pathologists #pancreas #pancpath #HPBpath #PanCan #PancreaticCancer #PancSM #pancreatitis #hpbcsm"

post_tweet(UpdateTweet2)



UpdateTweet3 <- "The Pancreatobiliary Pathology Society Journal Watch for the articles on the pancreatobiliary pathology will be released every other month. http://pbpath.org/pbpath-journal-watch/ #PBPath #GIPath #pathology #pathologists #pancreas #pancpath #HPBpath #PanCan #PancreaticCancer #PancSM #pancreatitis #hpbcsm"

post_tweet(UpdateTweet3)


UpdateTweet4 <- "Pancreatobiliary #Pathology Society Journal Watch August September 2018 is being prepared. Subscribe to the newsletter http://pbpath.org/newsletter/ and stay tuned. #PBPath #GIPath #pathologists #pancreas #pancpath #HPBpath #PanCan #PancreaticCancer #PancSM #pancreatitis #hpbcsm"

post_tweet(UpdateTweet4)







# https://twitter.com/USGIPS/status/1039936316094533633
# No time to keep up with your favorite journals? GIPS is here to help! The latest Journal Watch of important and interesting GI pathology articles is available on our website, exclusively for members: http://usgips.com/journal-watch-july-august-2018/ … #pathology #gipath
# 
# 
# https://twitter.com/LiverPath_HPHS/status/1024085514893373441
# 
# What's new in liver pathology?  The @LiverPath_HPHS #journalwatch team summarizes literature from the past 2 months.  See May/June 2018 through the link: http://goo.gl/X7PMjy 
