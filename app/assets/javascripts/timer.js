$(function() {
  // 'use strict';


  // declare vars
  var time_minutes, time_seconds, time_by_4, incrementTime, incrementTimeInterval, minutes, seconds, state, studyTime;

  // $('body > div > div > form').on("submit", function() {
  //   originalTime = $('#foo_study_time').val();
  //   console.log(originalTime);
  // });

  // get the time in minutes
  time_minutes = parseInt($('.countdown').html());
  // change it into seconds
  time_seconds = (time_minutes * 60);
  // divide it by 4
  time_by_4 = (time_seconds / 4);

  // display user-selected time upon first loading of page
  // format the minutes and seconds
  minutes = Math.floor(time_by_4 / 60);
  seconds = time_by_4 - (minutes * 60);

  if (minutes < 10) {
    minutes = "0" + minutes;
  };
  if (seconds < 10) {
    seconds = "0" + seconds;
  };

  $('.countdown').html(minutes + ':' + seconds);











  // pause/play button functionality

  $('.paused_alert').hide();

  state = true;

  $('button.play_pause').on('click', function() {
    $('.paused_alert').toggle()
    if (state) {
      clearInterval(incrementTimeInterval);
      $('#writingTextField').attr('disabled', 'disabled');
      $('body > div > div > form > div > div > input').attr('disabled', 'disabled');
      state = false;
    } else if (!state) {
      incrementTimeInterval = setInterval(incrementTime, 1000);
      $('#writingTextField').removeAttr('disabled');
      $('body > div > div > form > div > div > input').removeAttr('disabled');
      state = true;
    }
  });

  $('.ppover').on('click', function() {
    $('.paused_alert').toggle()
    if (state) {
      clearInterval(incrementTimeInterval);
      state = false;
    }
    /* else if (!state) {
          incrementTimeInterval = setInterval(incrementTime, 1000);
          state = true;
        }*/
  });




  var blink = function(el) {
    el.fadeTo(500, 0.5, function() {
      el.fadeTo(500, 1, function() {
        blink($('.countdown'));
      });
    });
  }




  var timesUp = function() {
    $('.countdown').html("00:00");
    console.log("time's up");
    $('#paused-overlay').hide();
    $('#options-overlay').show();
    blink($('.countdown'));
  }



  // function to increment time
  incrementTime = function() {

    minutes = Math.floor(time_by_4 / 60);
    seconds = time_by_4 - (minutes * 60);
    if (minutes < 10) {
      minutes = "0" + minutes;
    }
    if (seconds < 10) {
      seconds = "0" + seconds;
    }
    $('.countdown').html(minutes + ':' + seconds);

    time_by_4 -= 1

    if (time_by_4 == 0) {
      clearInterval(incrementTimeInterval);
      setTimeout(timesUp, 1000);
    };
  };

  // call incrementTime function every 1 second
  incrementTimeInterval = setInterval(incrementTime, 1000);









});
