$(document).on('page:change', function() 
{
	'use strict';

	var shadowingPopoverContent, speakingPopoverContent, listeningPopoverContent, writingPopoverContent, submitWritingPopoverContent;

	shadowingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  speakingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  listeningPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  writingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  submitWritingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";

  $('#shadowingPopover').popover(
  {
    title: "Shadowing",
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: shadowingPopoverContent
  })

  $('#speakingPopover').popover(
  {
    title: "Speaking",
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: speakingPopoverContent
  })

  $('#listeningPopover').popover(
  {
    title: 'Listening',
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: listeningPopoverContent
  })

  $('#writingPopover').popover(
  {
    title: 'Writing',
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: writingPopoverContent
  })

  $('#submitWritingPopover').popover(
  {
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: submitWritingPopoverContent
  })

})