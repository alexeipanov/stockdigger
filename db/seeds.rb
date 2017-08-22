# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! [
    { name: 'Alexei', email: 'windstarter@gmail.com', password: '456789', password_confirmation: '456789' }
]

User.last.collections.create! [
  { name: 'Crochet' },
  { name: 'Reggae' }
]

User.last.collections.first.keywords.create! [
	{ keyword: 'crochet' },
	{ keyword: 'crochetting' }
]

User.last.collections.first.images.create! [
	{ image: '543317008', url: '"https://image.shutterstock.com/display_pic_with_logo/4065097/543317008/stock-photo-balls-of-colored-yarn-view-from-above-all-the-colors-of-the-rainbow-sample-knit-women-s-hands-543317008.jpg' },
	{ image: '622633322', url: 'https://image.shutterstock.com/display_pic_with_logo/3434738/622633322/stock-photo-white-vintage-crochet-doily-cotton-yarn-for-knitting-and-crochet-hook-622633322.jpg' },
	{ image: '615073463', url: 'https://image.shutterstock.com/display_pic_with_logo/3434738/615073463/stock-photo-bright-crochet-boxes-and-crochet-hooks-with-numbers-pink-and-white-crochet-textile-tutorial-615073463.jpg' }
]

User.last.collections.last.keywords.create! [
	{ keyword: 'reggae' },
	{ keyword: 'marley' },
	{ keyword: 'jamaica' }
]

User.last.collections.last.images.create! [
	{ image: '487421065', url: 'https://image.shutterstock.com/display_pic_with_logo/3434738/487421065/stock-photo-reggae-colors-flag-crochet-knitted-style-background-top-view-collage-with-mirror-reflection-487421065.jpg' },
	{ image: '110125292', url: 'https://image.shutterstock.com/display_pic_with_logo/229912/110125292/stock-vector-watercolor-vector-background-with-classic-reggae-colors-110125292.jpg' },
	{ image: '321982310', url: 'https://image.shutterstock.com/display_pic_with_logo/1340161/321982310/stock-vector-vector-set-with-music-instruments-for-reggae-style-isolated-music-instruments-for-reggae-with-321982310.jpg' }
]
