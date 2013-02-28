class CommentMailer < ActionMailer::Base
  default from: "bruceyue001@gmail.com"

  def comment_email(post)
    @post = post
    mail(to: post.user.email, subject: post.title)
  end
end
