first_user = User.create(email: 'test@email.com', password: 'password', name: 'Tom', photo: 'https://image.shutterstock.com/image-vector/man-character-face-avatar-glasses-600w-542759665.jpg', bio: 'Teacher from Mexico.')
second_user = User.create(email: 'test1@email.com', password: 'password', name: 'Lilly', photo: 'https://image.shutterstock.com/image-vector/female-face-avatar-on-white-600w-562359607.jpg', bio: 'Teacher from Poland.')
first_user = User.create(email: 'test@email.com', password: 'password', name: 'Tom', photo: 'https://image.shutterstock.com/image-vector/man-character-face-avatar-glasses-600w-542759665.jpg', bio: 'Teacher from Mexico.', confirmed_at: Time.now)
second_user = User.create(email: 'test1@email.com', password: 'password', name: 'Lilly', photo: 'https://image.shutterstock.com/image-vector/female-face-avatar-on-white-600w-562359607.jpg', bio: 'Teacher from Poland.', confirmed_at: Time.now)

first_post = Post.create(user_id: first_user.id, title: 'Hello', text: 'This is first post')
second_post = Post.create(user_id: first_user.id, title: 'Hello', text: 'This issecond post')