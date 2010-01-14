require File.dirname(__FILE__) + "/spec_helper"

describe Feediscovery do
  
  describe "feeds from " do
    
    before(:all) do
      @feeds = Feediscovery.extract("http://blog.superfeedr.com/")
    end
    
    it "should extract 1 feed from http://blog.superfeedr.com/" do
      @feeds.should have(1).element
    end
    
    describe "the feed from " do
      it "should have the right href" do
        @feeds.first.href.should == "http://blog.superfeedr.com/atom.xml"
      end

      it "should have the right rel" do
        @feeds.first.rel.should == "alternate"
      end

      it "should have the right type" do
        @feeds.first.type.should == "application/atom+xml"
      end

      it "should have the right title" do
        @feeds.first.title.should == "Superfeedr' thoughts"
      end
    end
  end
  
  it "should return an empty array if the url has no feeds" do
    Feediscovery.extract("http://google.com/").should == []
  end
  
end