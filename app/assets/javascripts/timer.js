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
      state = false;
    } else if (!state) {
      incrementTimeInterval = setInterval(incrementTime, 1000);
      state = true;
    }
  });

  $('#shadowingPopover').on('click', function() {
    $('.paused_alert').toggle()
    if (state) {
      clearInterval(incrementTimeInterval);
      state = false;
    } else if (!state) {
      incrementTimeInterval = setInterval(incrementTime, 1000);
      state = true;
    }
  });










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
      console.log("time's up");
    };

  };

  // call incrementTime function every 1 second
  incrementTimeInterval = setInterval(incrementTime, 1000);









});
