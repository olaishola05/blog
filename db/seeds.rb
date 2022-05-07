# USERS

users = [{
    :name => "James",
    :photo => "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
    :bio => "Biology"
  },{
    :name => "Samantha",
    :photo => "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg",
    :bio => "Fashion Designer"
  },{
    :name => "Jane",
    :photo => "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
    :bio => "News Reporter"
  },{
    :name => "Spencer",
    :photo => "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg",
    :bio => "Soccer Player"
  },
  {
    :name => "Lilly",
    :photo => "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg",
    :bio => "Teacher from Poland.",
  },

  {
    :name => "Tom",
    :photo => "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
    :bio => "Teacher from Mexico.",
  },

  {
    :name => "Mike",
    :photo => "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
    :bio => "Teacher from Zimbabwe",
  }
]

  users.each do |user|
    User.create(name: user[:name], photo: user[:photo], bio: user[:bio])
  end

  # POSTS

  post_text = "Lobortis elementum nibh tellus molestie nunc.
  Venenatis urna cursus eget nunc scelerisque viverra mauris
  in aliquam. Et tortor consequat id porta nibh. Diam ut
  venenatis tellus in metus vulputate. Pharetra convallis
  posuere morbi leo urna. Mauris commodo quis imperdiet massa
  tincidunt. Tincidunt eget nullam non nisi est sit amet.
  Tempor commodo ullamcorper a lacus."

  posts = [{
    :title => "Photosynthesis",
    :text => post_text,
    :user_id => 1
  },{
    :title => "Elon Masks finally bought twitter!",
    :text => post_text,
    :user_id => 3
  },{
    :title => "Easy sprained Ankle treatment",
    :text => post_text,
    :user_id => 4
  },{
    :title => "10 ways you can rip your jeans",
    :text => post_text,
    :user_id => 2
  },{
    :title => "Global Warming",
    :text => post_text,
    :user_id => 3
  },{
    :title => "Transpiration",
    :text => post_text,
    :user_id => 1
  },{
    :title => "Top 5 exercises for your core",
    :text => post_text,
    :user_id => 4
  },{
    :title => "Trending fashion brands in 2022",
    :text => post_text,
    :user_id => 2
  }]

  posts.each do |post|
    Post.create(title: post[:title], text: post[:text] ,user_id: post[:user_id])
  end

  # COMMENTS

  comments = [{
    :text => "Nemo enim ipsam",
    :user_id => 4,
    :post_id => 6
  },{
    :text => "labore et dolore",
    :user_id => 3,
    :post_id => 4
  },{
    :text => "Mauris commodo quis",
    :user_id => 3,
    :post_id => 3
  },{
    :text => "Elementum pulvinar etiam ",
    :user_id => 1,
    :post_id => 5
  },{
    :text => "perspiciatis unde omnis",
    :user_id => 2,
    :post_id => 1
  },{
    :text => "Elit at imperdiet dui",
    :user_id => 2,
    :post_id => 2
  },{
    :text => "Adipiscing enim eu turpis",
    :user_id => 2,
    :post_id => 5
  },{
    :text => "Ornare arcu dui vivamus",
    :user_id => 3,
    :post_id => 7
  },{
    :text => "Volutpat odio facilisis ",
    :user_id => 1,
    :post_id => 3
  },{
    :text => "architecto beatae vitae ",
    :user_id => 1,
    :post_id => 4
  },{
    :text => "natus error sit voluptatem accusantium ",
    :user_id => 3,
    :post_id => 8
  },{
    :text => "Ut enim ad minima veniam",
    :user_id => 3,
    :post_id => 1
  },{
    :text => "aliquid ex ea commodi",
    :user_id => 1,
    :post_id => 8
  },{
    :text => "Et tortor consequat id",
    :user_id => 2,
    :post_id => 7
  },{
    :text => "Maecenas ultricies mi",
    :user_id => 4,
    :post_id => 2
  },{
    :text => "Et tortor consequat id",
    :user_id => 7,
    :post_id => 2
  }]

  comments.each do |comment|
    Comment.create(text: comment[:text], user_id: comment[:user_id], post_id: comment[:post_id])
  end

  # LIKES

  likes = [{
    :user_id => 3,
    :post_id => 1
  },{
    :user_id => 2,
    :post_id => 3
  },{
    :user_id => 4,
    :post_id => 8
  },{
    :user_id => 1,
    :post_id => 5
  },{
    :user_id => 4,
    :post_id => 2
  },{
    :user_id => 1,
    :post_id => 6
  },{
    :user_id => 3,
    :post_id => 1
  },{
    :user_id => 2,
    :post_id => 3
  },{
    :user_id => 1,
    :post_id => 4
  },{
    :user_id => 1,
    :post_id => 5
  },{
    :user_id => 3,
    :post_id => 7
  },{
    :user_id => 4,
    :post_id => 2
  },{
    :user_id => 1,
    :post_id => 6
  },{
    :user_id => 3,
    :post_id => 1
  },{
    :user_id => 1,
    :post_id => 4
  },{
    :user_id => 4,
    :post_id => 8
  },{
    :user_id => 3,
    :post_id => 7
  },{
    :user_id => 4,
    :post_id => 2
  },{
    :user_id => 1,
    :post_id => 6
  }]

  likes.each do |like|
    Like.create(user_id: like[:user_id], post_id: like[:post_id])
  end
