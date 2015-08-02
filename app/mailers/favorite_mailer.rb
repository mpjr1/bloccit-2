class FavoriteMailer < ActionMailer::Base
   default from: "mapg.jr@gmail.com"

   def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@bloccit-2.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@bloccit-2.example>"
     headers["References"] = "<post/#{post.id}@bloccit-2.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
 end