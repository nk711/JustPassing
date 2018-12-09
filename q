[33mcommit f829658fbf3f5e3af11c7ccb111affd0307e5cf0[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Dec 6 21:06:54 2018 +0000

    added a test to category model to test if an object can be saved if the name field is empty

[33mcommit 11bf3df23a85de9fdd3d1f3063f74ada6966bf8f[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Dec 6 21:01:06 2018 +0000

    migration worked as expected, added not null to name field in the categories table

[33mcommit 881ec908b424fdbe3b73c07b767166882521c730[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Dec 6 20:58:44 2018 +0000

    created a migration file to add not null to an attribute, commiting just incase of an irreversable migration

[33mcommit 53e3954d6b191ce5f8f396369797d147e7041b03[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Dec 6 20:48:23 2018 +0000

    made the name column in the table categories unique

[33mcommit ddb47530d0d4c9fed556a9c070d7b34a933aae83[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Dec 6 20:44:55 2018 +0000

    Added a logo on to the nav bar, added syling to the navbar, added a search bar on the home page

[33mcommit e6c5b3ac7cc2c1310b1ca1ac452878c72bb3de3e[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Tue Dec 4 23:33:14 2018 +0000

    Added testing for all models

[33mcommit 9c9be1353f941cbdd17710a220c0d41e4d33b4b0[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Tue Dec 4 13:49:54 2018 +0000

    Added styling for post page, only an image at the top has been added and styled for design purposes

[33mcommit 694a49256f6cfdbcc7c7eb81ad970ed93388382e[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Sun Dec 2 00:30:36 2018 +0000

    Added average score (calculated by the ratings in the comments section) for a user profile, will need to add validation so that the user can not post again on the same profile until 3-5 days later

[33mcommit cb127344d867b685fe640099d606d49142ffb145[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 30 23:52:19 2018 +0000

    Had a problem, the stars did not appear for my profile reviews, i had fixed this issue and the stars now appear correctly

[33mcommit a1afcb13e0288bc504e693c1a0a68646ccb0610d[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Nov 29 02:07:02 2018 +0000

    Added ratf, itll provide a visual representation of ratings of a comment in a user's profile

[33mcommit 291cff503b7434ba3923e159bb1e83f8c50fda2d[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 18:40:12 2018 +0000

    Renamed post_id column to profile_id in reviews table

[33mcommit e504470711dcf01a28b47bcf6f33ce39e3b02ce0[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 18:08:09 2018 +0000

    Removed profile model and generated a profile scaffold instead

[33mcommit 58b5940bb3f4d4ba95648895c4ddb613b82424f5[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 17:28:45 2018 +0000

    generated a profile model to store more information about the user

[33mcommit a2acf037b9422784ecda0f71b194b444709344c2[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 15:51:24 2018 +0000

    Added post id to review table to allow for an association between reviews and a specific post

[33mcommit dcf45351242c71d6102930233132f76ade7fb22f[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 15:49:58 2018 +0000

    updated review table, added user-id to allow for an association between reviews and user

[33mcommit 23e0e4c6ecb10d2d71bbff50248a378d8a4fbb50[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 15:45:17 2018 +0000

    Added migration file to add user id to the new reviews table

[33mcommit e5be184095f118c6cd3909bf42825a4e6076ab98[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 15:41:16 2018 +0000

    updated the schema with a migration file generated from scaffold

[33mcommit 20ac6b104e6e518bfd93b9beb02cc8c11f921246[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 15:35:17 2018 +0000

    RE-Generated a scaffold with name review

[33mcommit ef38a28ae0ab0ee0d42deeab888b5e6d9a61a344[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 15:34:32 2018 +0000

    Deleted scaffold, incorrect name

[33mcommit cb2be24a9940c9c6265d152b513387f4b121559f[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 15:32:42 2018 +0000

    generated a scaffold with name review

[33mcommit 331a4a1c171176abffd9910503e42c1a4ac388d1[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 00:28:43 2018 +0000

    Setted up paper clip gem

[33mcommit 3190bfc80502864c852804eb9b6b6bc7ea945eec[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 28 00:05:49 2018 +0000

    Added Paper Clip v6.0.0 gem

[33mcommit 2f561e339ada1f30977e44513660fcc40769e97b[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 21:51:18 2018 +0000

    Adding a partial view called filter which will allow the user to refine the list of posts

[33mcommit 12cdd66bb49f015281e8bbb56a5a3414bb92ed26[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 19:26:53 2018 +0000

    Added associations between the user, posts and category models, worked on the posts_controller so that the user can set a category for a post

[33mcommit 45e43ad500f970b09d090370906b0236960d495f[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 19:01:15 2018 +0000

    Added category ID to post table

[33mcommit d01eb5142800d135c6fb06e5d48f951659340592[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 18:59:40 2018 +0000

    Added a new model category which will be used to categorise posts

[33mcommit b47df2554a66c57d071435a679eef4cda8005814[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 18:58:12 2018 +0000

    removing the category column from the table post, better to have a one to one association between posts and a new table named category

[33mcommit 86fe9e27e4d08b772f98151ccc0f542b512ede1d[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 18:42:35 2018 +0000

    Added User ID into post table

[33mcommit 645a1d8c5564e8fbeaea8b926bf828a63a80764b[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 18:15:42 2018 +0000

    Installed devise, a user authentication gem. generated views and model and added alert to application.html.haml

[33mcommit 51a3ea5493ef21f37bac37f7c98686bcc7ee1d2b[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 15:58:55 2018 +0000

    Uninstalled Clearance gem, deleted it's views, controllers, routes and schema table.

[33mcommit 2aba26f4e3aea1a5aa740326888a4d4459f4a057[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Fri Nov 23 00:00:15 2018 +0000

    In the process of adding more fields to the sign up process, also edited the users table and removed the number column

[33mcommit efff3326357b55f838c066e1334526ceb4fcde81[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Nov 22 20:38:16 2018 +0000

    Added edit, show html.haml files

[33mcommit 4a0ed129a4d1753f6e7678901548a35461909ba6[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Thu Nov 22 17:33:39 2018 +0000

    Added phone number to Post schema

[33mcommit c70808dfe67a020d29bd6505561b986da19bd451[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Wed Nov 21 19:49:00 2018 +0000

    added default value 'Other' to category column in post table through migration

[33mcommit 009450d0ea3687553c0633ffa47e93f62155e7ce[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Tue Nov 20 15:51:59 2018 +0000

    creating routes for posts

[33mcommit 8ff6b2f2a3d154c2301ec532f63808057b12903b[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Tue Nov 20 15:41:46 2018 +0000

    Generated a user controller

[33mcommit eacc6482051173aa7edd4c0d1f268535ce755a4a[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Tue Nov 20 15:24:03 2018 +0000

    Added first name, last name, number fields to user table

[33mcommit d1a23f9ca2864af897f08e88ad24cbb836f56a24[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Tue Nov 20 14:55:24 2018 +0000

    Created a 'AddFieldsToUsers' migration file

[33mcommit 7ba80950a8418e36fd971b432954baca21dd66a8[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Tue Nov 20 14:41:13 2018 +0000

    Added Posts controller + created a post table through a migration

[33mcommit 36e584d41095b892a94951bb2e82f986de1dc82b[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Tue Nov 20 14:17:18 2018 +0000

    added post model

[33mcommit a124f7ced224e5c47561f3e6c2143c9ee35776a5[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Tue Nov 20 13:20:56 2018 +0000

    Added clearance gem, generated user model

[33mcommit e027f2ad46850a8209f42c007837a8f15204030f[m
Author: nk00374 <nk00374@surrey.ac.uk>
Date:   Sun Nov 18 22:39:03 2018 +0000

    Generated Pages controller, currently has a blank index and contact page

[33mcommit a197652acb3a428bae550c54d50f62610f18a2d7[m
Author: Nithesh Koneswaran <nk00374@surrey.ac.uk>
Date:   Sun Nov 18 21:56:48 2018 +0000

    Initial commit
