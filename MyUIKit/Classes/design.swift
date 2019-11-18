import Foundation

public protocol MyColorProtocol {

      func primary_01(tint: Int) -> UIColor?
      
      func primary_02(tint: Int) -> UIColor?
      
      func basic(tint: Int) -> UIColor?
      
      func secondary_01(tint: Int) -> UIColor?
      
      func success(tint: Int) -> UIColor?
      
      func informations(tint: Int) -> UIColor?
      
      func warning(tint: Int) -> UIColor?
      
      func danger(tint: Int) -> UIColor?
      
}

public protocol MyTextStyleProtocol {


	  var fonts: [String] { get }

      var h1_headline_primary_01_500: TextStyle { get }
          
      var h2_headline_primary_01_500: TextStyle { get }
          
      var h3_headline_primary_01_500: TextStyle { get }
          
      var h4_headline_primary_01_500: TextStyle { get }
          
      var h5_headline_primary_01_500: TextStyle { get }
          
      var h6_headline_primary_01_500: TextStyle { get }
          
      var s1_subtitle_primary_01_500: TextStyle { get }
          
      var s2_subtitle_primary_01_500: TextStyle { get }
          
      var p1_paragraph_primary_01_500: TextStyle { get }
          
      var p2_paragraph_primary_01_500: TextStyle { get }
          
      var c1_caption_primary_01_500: TextStyle { get }
          
      var c2_caption_primary_01_500: TextStyle { get }
          
      var label_primary_01_500: TextStyle { get }
          
      var h1_headline_basic_600: TextStyle { get }
          
      var h2_headline_basic_600: TextStyle { get }
          
      var h3_headline_basic_600: TextStyle { get }
          
      var h4_headline_basic_600: TextStyle { get }
          
      var h5_headline_basic_600: TextStyle { get }
          
      var h6_headline_basic_600: TextStyle { get }
          
      var s1_subtitle_basic_600: TextStyle { get }
          
      var s2_subtitle_basic_600: TextStyle { get }
          
      var p1_paragraph_basic_600: TextStyle { get }
          
      var p2_paragraph_basic_600: TextStyle { get }
          
      var c1_caption_basic_600: TextStyle { get }
          
      var c2_caption_basic_600: TextStyle { get }
          
      var label_basic_600: TextStyle { get }
          
      var h1_headline_basic_100: TextStyle { get }
          
      var h2_headline_basic_100: TextStyle { get }
          
      var h3_headline_basic_100: TextStyle { get }
          
      var h4_headline_basic_100: TextStyle { get }
          
      var h5_headline_basic_100: TextStyle { get }
          
      var h6_headline_basic_100: TextStyle { get }
          
      var s1_subtitle_basic_100: TextStyle { get }
          
      var s2_subtitle_basic_100: TextStyle { get }
          
      var p1_paragraph_basic_100: TextStyle { get }
          
      var p2_paragraph_basic_100: TextStyle { get }
          
      var c1_caption_basic_100: TextStyle { get }
          
      var c2_caption_basic_100: TextStyle { get }
          
      var label_basic_100: TextStyle { get }
          
      var s1_subtitle_basic_400: TextStyle { get }
          
      var s2_subtitle_basic_400: TextStyle { get }
          
      var p1_paragraph_basic_400: TextStyle { get }
          
      var p2_paragraph_basic_400: TextStyle { get }
          
      var s1_subtitle_basic_500: TextStyle { get }
          
      var s2_subtitle_basic_500: TextStyle { get }
          
      var p1_paragraph_basic_500: TextStyle { get }
          
      var p2_paragraph_basic_500: TextStyle { get }
          
      var s1_subtitle_success_200: TextStyle { get }
          
      var s2_subtitle_success_200: TextStyle { get }
          
      var p1_paragraph_success_200: TextStyle { get }
          
      var p2_paragraph_success_200: TextStyle { get }
          
      var s1_subtitle_warning_200: TextStyle { get }
          
      var s2_subtitle_warning_200: TextStyle { get }
          
      var p1_paragraph_warning_200: TextStyle { get }
          
      var p2_paragraph_warning_200: TextStyle { get }
          
      var s1_subtitle_information_200: TextStyle { get }
          
      var s2_subtitle_information_200: TextStyle { get }
          
      var p1_paragraph_information_200: TextStyle { get }
          
      var p2_paragraph_information_200: TextStyle { get }
          
      var s1_subtitle_danger_200: TextStyle { get }
          
      var s2_subtitle_danger_200: TextStyle { get }
          
      var p1_paragraph_danger_200: TextStyle { get }
          
      var p2_paragraph_danger_200: TextStyle { get }
          
      var button_fixed_basic_600: TextStyle { get }
          
      var button_medium_basic_600: TextStyle { get }
          
      var button_tiny_basic_600: TextStyle { get }
          
      var button_fixed_basic_400: TextStyle { get }
          
      var button_medium_basic_400: TextStyle { get }
          
      var button_tiny_basic_400: TextStyle { get }
          
      var button_fixed_basic_100: TextStyle { get }
          
      var button_medium_basic_100: TextStyle { get }
          
      var button_tiny_basic_100: TextStyle { get }
          
      var button_fixed_primary_01_500: TextStyle { get }
          
      var button_medium_primary_01_500: TextStyle { get }
          
      var button_tiny_primary_01_500: TextStyle { get }
          
      var tabbar_basic_500: TextStyle { get }
          
      var tabbar_primary_01_500: TextStyle { get }
          
}