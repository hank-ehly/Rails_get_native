'use strict';

// declare vars
var time_minutes, time_seconds, time_seconds_by_4, incrementTime, incrementTimeInterval, minutes, seconds, state, studyTime, video_url, controls_bool, autoplay_bool;

// load javascript YT API
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;

function onYouTubeIframeAPIReady()
{
  player = new YT.Player('player',
  {
    height: '390',
    width: '640',
    videoId: video_url,
    playerVars:
    {
      controls: controls_bool,
      modestbranding: 1,
      showinfo: 0,
      autoplay: autoplay_bool,
      loop: 1,
      playlist: video_url,
      enablejsapi: 1
    },
    events:
    {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

var blink = function(el)
{
  el.fadeTo(500, 0.3, function()
  {
    el.fadeTo(500, 1, function()
    {
      blink($('.countdown'));
    });
  });
}



var timesUp = function()
{
  player.pauseVideo();
  $('button.play_pause').attr('disabled', 'disabled');
  $('.playPauseVideoOnly').attr('disabled', 'disabled');
  $('.countdown').html("00:00");
  console.log("time's up");
  $('#paused-overlay').hide();
  $('#options-overlay').show();
  blink($('.countdown'));
}

// function to increment time
incrementTime = function()
{

  minutes = Math.floor(time_seconds_by_4 / 60);
  seconds = time_seconds_by_4 - (minutes * 60);
  if (minutes < 10)
  {
    minutes = "0" + minutes;
  }
  if (seconds < 10)
  {
    seconds = "0" + seconds;
  }
  $('.countdown').html(minutes + ':' + seconds);

  time_seconds_by_4 -= 1

  if (time_seconds_by_4 == 0)
  {
    clearInterval(incrementTimeInterval);
    setTimeout(timesUp, 1000);
  };
};

function onPlayerReady(event)
{
  $('button.play_pause').removeAttr('disabled');
  $('.playPauseVideoOnly').removeAttr('disabled');
  // event.target.playVideo();
  // call incrementTime function every 1 second
  incrementTimeInterval = setInterval(incrementTime, 1000);
}

function onPlayerStateChange(event)
{

  if (event.data == YT.PlayerState.PLAYING)
  {
    // clearInterval(incrementTimeInterval);
  }
  else if (event.data == YT.PlayerState.PAUSED)
  {
    // incrementTimeInterval = setInterval(incrementTime, 1000);
  }
}

$(document).on('page:change', function()
{

  $('button.play_pause').on('click', function()
    {

      // ********* GET DURATION
      // console.log(player.getDuration()); <-- get video duration

      // ********* GET PLAYER STATE **********
      // console.log(player.getPlayerState());
      // console.log(YT.PlayerState.PLAYING);

      if (player.getPlayerState() == YT.PlayerState.PAUSED)
      {
        player.playVideo();
        $('#paused-overlay').hide();
      }
      else if (player.getPlayerState() == YT.PlayerState.PLAYING)
      {
        player.pauseVideo();
        if ($('#options-overlay').css('display') == 'block')
        {
          return false;
        }
        else
        {
          $('#paused-overlay').show();
        }
      }

    }) // on BIG button click

  $('button.btn.btn-default.ppover').on('click', function()
  {
    if (player)
    {
      if (player.getPlayerState() == YT.PlayerState.PLAYING)
      {
        player.pauseVideo();
        $('#paused-overlay').show();
        // if (controls_bool == 0) {
        //   
        // }
      }
    }

  })

  // event.data == YT.PlayerState.PLAYING
  // event.data returns integer corresponding to YT.PlayerState.PLAYING/PAUSED/etc...
  // to check player state, echo event.data


  // get the time in minutes
  time_minutes = parseInt($('.countdown').html());
  // change it into seconds
  time_seconds = (time_minutes * 60);
  // divide it by 4
  time_seconds_by_4 = (time_seconds / 4);
  // display user-selected time upon first loading of page
  // format the minutes and seconds
  minutes = Math.floor(time_seconds_by_4 / 60);
  seconds = time_seconds_by_4 - (minutes * 60);

  if (minutes < 10)
  {
    minutes = "0" + minutes;
  };
  if (seconds < 10)
  {
    seconds = "0" + seconds;
  };

  $('.countdown').html(minutes + ':' + seconds);






  // pause/play button functionality

  $('.paused_alert').hide();

  state = true;

  $('button.play_pause').on('click', function()
  {
    if (!$(this).hasClass('onlyVideo'))
    {
      if (state)
      {
        clearInterval(incrementTimeInterval);
        $('#writingTextField').attr('disabled', 'disabled');
        $('body > div > div > form > div > div > input').attr('disabled', 'disabled');
        state = false;
      }
      else if (!state)
      {
        incrementTimeInterval = setInterval(incrementTime, 1000);
        $('#writingTextField').removeAttr('disabled');
        $('body > div > div > form > div > div > input').removeAttr('disabled');
        state = true;
      }
    }
  });

  $('button.forTimerOnly').on('click', function()
  {
    if (!$(this).hasClass('onlyVideo'))
    {
      if (state)
      {
        clearInterval(incrementTimeInterval);
        $('span.isPausedOrNot').show();
        state = false;
      }
      else if (!state)
      {
        incrementTimeInterval = setInterval(incrementTime, 1000);
        $('span.isPausedOrNot').hide();
        state = true;
      }
    }
  })

  $('.ppover').on('click', function()
  {
    $('.paused_alert').toggle()
    if (state)
    {
      clearInterval(incrementTimeInterval);
      state = false;
    }
  });


});
