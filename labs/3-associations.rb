# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

salesperson1 = Salesperson.find_by({"first_name" => "John"})
contact1 = Contact.find_by({"first_name" => "Jeff"})
contact2 = Contact.find_by({"first_name" => "Tim"})

activity = Activity.new
activity["salesperson_id"] = salesperson1["id"]
activity["contact_id"] = contact1["id"]
activity["note"] = "Email sent"
activity.save

activity = Activity.new
activity["salesperson_id"] = salesperson1["id"]
activity["contact_id"] = contact1["id"]
activity["note"] = "Email received"
activity.save

activity = Activity.new
activity["salesperson_id"] = salesperson1["id"]
activity["contact_id"] = contact2["id"]
activity["note"] = "Missed call"
activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

contact_ofinterest = "Jeff" 

puts "Activities with #{contact_ofinterest}"
for activity in Activity.all
    if Contact.find_by({"id" => activity["contact_id"]})["first_name"] == contact_ofinterest
        puts "- #{activity["note"]}"
    end
end


# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
