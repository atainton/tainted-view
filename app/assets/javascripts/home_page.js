$(document).ready(function(){
  // This variable is video specific, current video is 10.88 seconds long
  var video_length_round = 11;

  var $video = $('#home_video_element');
  var video = $video.get(0);
  var mp4Source = $('#mp4Source');
  var mp4_video_path = mp4Source.attr('data-source');

  // Ensure home_video present on page
  if(typeof video !== 'undefined'){

    // Ensure home_video is a display type block (ie. not a mobile client)
    if($video.css('display') == 'block'){
      // Ensure video element has an mp4Source, if so then update video src
      if(typeof mp4Source.get(0) !== 'undefined'){
        mp4Source.attr('src', mp4_video_path);
      }

      video.load();
     
      video.addEventListener("canplay", function() {
        this.removeEventListener("canplay", arguments.callee, false);

        if(Math.round(video.buffered.end(0)) >= video_length_round){
          // Video is already loaded
          this.play();

        } else {
          // Monitor video buffer progress before playing
          video.addEventListener("progress", function() {
            if(Math.round(video.buffered.end(0)) == video_length_round){
              this.removeEventListener("progress", arguments.callee, false);
              this.play();
            }
          }, false);
        }
      }, false);
    }
  }
});