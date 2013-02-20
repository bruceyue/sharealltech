// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){

	// Slider
    $("#mainslider").flexslider({
        animation: "slide",
        slideshow: false, // ***
        useCSS: false,
        controlNav: true,
        animationLoop: false,
        smoothHeight: true
    });
    // LayerSlider
    if ($('#layerslider').length) {
        $('#layerslider').layerSlider({
            skinsPath : 'css/skins/',
            skin : 'minimal',
            thumbnailNavigation : 'always'
        });
    } else {}

    // Disable href="#" links
    $('a').click(function(){if ($(this).attr('href') == '#') {return false;}});
    $('a').live('click', function(){if ($(this).attr('href') == '#') {return false;}});
    $('a').css('text-decoration', 'none');

    // tooltip
    $("a[rel^='tooltip']").tooltip();

    //Menu
    jQuery('#menu > ul').superfish({
        delay:       0,
        animation:   {
            opacity:'show',
            height:'show'
        },
        speed:       'fast',
        autoArrows:  false
    });
    (function() {
		var $menu = $('#menu ul'),
			optionsList = '<option value="" selected>Menu...</option>';

		$menu.find('li').each(function() {
			var $this   = $(this),
				$anchor = $this.children('a'),
				depth   = $this.parents('ul').length - 1,
				indent  = '';
			if( depth ) {
				while( depth > 0 ) {
					indent += ' - ';
					depth--;
				}
			}
			optionsList += '<option value="' + $anchor.attr('href') + '">' + indent + ' ' + $anchor.text() + '</option>';
		}).end().after('<select class="res-menu">' + optionsList + '</select>');

		$('.res-menu').on('change', function() {
			window.location = $(this).val();
		});

	})();

    // To Top Button
    $(function(){
        $().UItoTop({ easingType: 'easeOutQuart' });
    });

    // Placeholder
    $('[placeholder]').focus(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
            input.val('');
            input.removeClass('placeholder');
        }
    }).blur(function() {
        var input = $(this);
        if (input.val() == '' || input.val() == input.attr('placeholder')) {
            input.addClass('placeholder');
            input.val(input.attr('placeholder'));
        }
        }).blur().parents('form').submit(function() {
            $(this).find('[placeholder]').each(function() {
                var input = $(this);
                if (input.val() == input.attr('placeholder')) {
                    input.val('');
                }
            })
        });

    // Accordion settings
    $(function() {
        $('.accordion').on('show', function (e) {
            $(e.target).prev('.accordion-heading').find('i').removeClass('iconm-plus-3');
            $(e.target).prev('.accordion-heading').find('i').addClass('iconm-minus-3');
        });
        $('.accordion').on('hide', function (e) {
            $(e.target).prev('.accordion-heading').find('i').removeClass('iconm-minus-3');
            $(e.target).prev('.accordion-heading').find('i').addClass('iconm-plus-3');
        });
    });

});