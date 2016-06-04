#Mike yelp map

![](https://cloud.githubusercontent.com/assets/19749326/15800638/7e037bcc-2a4c-11e6-9682-b069b282a0f9.png)

##Author

Mike

this is a section of a get together dining app. pick a friend from a table and use the yelp to find your food interest location. 

##File list

###token.h  

must register for yelp developer to get api access. they will provide the tokens 



###loader.m 

this is a simulated loader. loads up simulated profiles 


###Needed folders (SDWebImage and OAuthConsumer) 

SDWebImage  - gets the picture from an http string

OAuthConsumer - needed folder from yelp SDK package

###PLIST 

as for plist need to add the following

NSLocationWhenInUseUsage

NSAppTransportSecurity  dict -> NSAllowsArbitraryLoads -> bool yes
 
##How to run the file

once downloaded .. make sure you have to folder (SDWebImage and OAuthConsumer) 

need the **SDWebImage** to show the picture from an Url and **OAuthConsumer** which is given by yelp SDK package. must add **NSLocationWhenInUseUsage** and **NSAppTransportSecurity** to your *Plist* .. also the yelp prefix to avoid errors from legacy classes and functions. 

##Bugs


