# encoding: utf-8
# 
# 
# 
module Mail
  class ContentTransferEncodingField < StructuredField
    
    FIELD_NAME = 'content-transfer-encoding'
    CAPITALIZED_FIELD = 'Content-Transfer-Encoding'
    
    def initialize(*args)
      super(CAPITALIZED_FIELD, strip_field(FIELD_NAME, args.last.to_s.downcase))
    end
    
    def parse(val = value)
      unless val.blank?
        @element = Mail::ContentTransferEncodingElement.new(val)
      end
    end
    
    def tree
      STDERR.puts("tree is deprecated.  Please use encoding to get parse result\n#{caller}")
      @element ||= Mail::ContentTransferEncodingElement.new(value)
      @tree ||= @element.tree
    end
    
    def element
      @element ||= Mail::ContentTransferEncodingElement.new(value)
    end
    
    def encoding
      element.encoding
    end
    
    # TODO: Fix this up
    def encoded
      "#{CAPITALIZED_FIELD}: #{encoding}\r\n"
    end
    
    def decoded
      encoding
    end
    
  end
end
