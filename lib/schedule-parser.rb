require 'open-uri'
require 'Nokogiri'
module ScheduleParser
    PATH_TO_SCHEDULE = "http://www.bsuir.by/psched/rest/"
    
    def downloadXmlOfGroup(groupId)
	    xml = open(PATH_TO_SCHEDULE+groupId)
    end

    def parseLessonsFromXml(xml)    	
    	xml_content = xml.read
    	reader = Nokogiri::XML(xml_content)
        lessons = reader.xpath("//*[@faculty]");
        return lessons	
    end

    def printLessons(lessons)
        lessons.each do |lesson|
	       attributes = lesson.attributes()	
	       attributes.each do |name, value|
		      puts name+":"+value
	       end
	       p "-----------------------"
	    end
    end
end
