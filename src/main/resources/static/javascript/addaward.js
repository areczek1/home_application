$(function(){

    var icons = [
        'glyphicon-adjust',
        'glyphicon-align-center',
        'glyphicon-align-justify',
        'glyphicon-align-left',
        'glyphicon-align-right',
        'glyphicon-arrow-down',
        'glyphicon-arrow-left',
        'glyphicon-arrow-right',
        'glyphicon-arrow-up',
        'glyphicon-asterisk',
        'glyphicon-backward',
        'glyphicon-ban-circle',
        'glyphicon-barcode',
        'glyphicon-bell',
        'glyphicon-bold',
        'glyphicon-book',
        'glyphicon-bookmark',
        'glyphicon-briefcase',
        'glyphicon-bullhorn',
        'glyphicon-calendar',
        'glyphicon-camera',
        'glyphicon-certificate',
        'glyphicon-check',
        'glyphicon-chevron-down',
        'glyphicon-chevron-left',
        'glyphicon-chevron-right',
        'glyphicon-chevron-up',
        'glyphicon-circle-arrow-down',
        'glyphicon-circle-arrow-left',
        'glyphicon-circle-arrow-right',
        'glyphicon-circle-arrow-up',
        'glyphicon-cloud',
        'glyphicon-cloud-download',
        'glyphicon-cloud-upload',
        'glyphicon-cog',
        'glyphicon-collapse-down',
        'glyphicon-collapse-up',
        'glyphicon-comment',
        'glyphicon-compressed',
        'glyphicon-copyright-mark',
        'glyphicon-credit-card',
        'glyphicon-cutlery',
        'glyphicon-dashboard',
        'glyphicon-download',
        'glyphicon-download-alt',
        'glyphicon-earphone',
        'glyphicon-edit',
        'glyphicon-eject',
        'glyphicon-envelope',
        'glyphicon-euro',
        'glyphicon-exclamation-sign',
        'glyphicon-expand',
        'glyphicon-export',
        'glyphicon-eye-close',
        'glyphicon-eye-open',
        'glyphicon-facetime-video',
        'glyphicon-fast-backward',
        'glyphicon-fast-forward',
        'glyphicon-file',
        'glyphicon-film',
        'glyphicon-filter',
        'glyphicon-fire',
        'glyphicon-flag',
        'glyphicon-flash',
        'glyphicon-floppy-disk',
        'glyphicon-floppy-open',
        'glyphicon-floppy-remove',
        'glyphicon-floppy-save',
        'glyphicon-floppy-saved',
        'glyphicon-folder-close',
        'glyphicon-folder-open',
        'glyphicon-font',
        'glyphicon-forward',
        'glyphicon-fullscreen',
        'glyphicon-gbp',
        'glyphicon-gift',
        'glyphicon-glass',
        'glyphicon-globe',
        'glyphicon-hand-down',
        'glyphicon-hand-left',
        'glyphicon-hand-right',
        'glyphicon-hand-up',
        'glyphicon-hd-video',
        'glyphicon-hdd',
        'glyphicon-header',
        'glyphicon-headphones',
        'glyphicon-heart',
        'glyphicon-heart-empty',
        'glyphicon-home',
        'glyphicon-import',
        'glyphicon-inbox',
        'glyphicon-indent-left',
        'glyphicon-indent-right',
        'glyphicon-info-sign',
        'glyphicon-italic',
        'glyphicon-leaf',
        'glyphicon-link',
        'glyphicon-list',
        'glyphicon-list-alt',
        'glyphicon-lock',
        'glyphicon-log-in',
        'glyphicon-log-out',
        'glyphicon-magnet',
        'glyphicon-map-marker',
        'glyphicon-minus',
        'glyphicon-minus-sign',
        'glyphicon-move',
        'glyphicon-music',
        'glyphicon-new-window',
        'glyphicon-off',
        'glyphicon-ok',
        'glyphicon-ok-circle',
        'glyphicon-ok-sign',
        'glyphicon-open',
        'glyphicon-paperclip',
        'glyphicon-pause',
        'glyphicon-pencil',
        'glyphicon-phone',
        'glyphicon-phone-alt',
        'glyphicon-picture',
        'glyphicon-plane',
        'glyphicon-play',
        'glyphicon-play-circle',
        'glyphicon-plus',
        'glyphicon-plus-sign',
        'glyphicon-print',
        'glyphicon-pushpin',
        'glyphicon-qrcode',
        'glyphicon-question-sign',
        'glyphicon-random',
        'glyphicon-record',
        'glyphicon-refresh',
        'glyphicon-registration-mark',
        'glyphicon-remove',
        'glyphicon-remove-circle',
        'glyphicon-remove-sign',
        'glyphicon-repeat',
        'glyphicon-resize-full',
        'glyphicon-resize-horizontal',
        'glyphicon-resize-small',
        'glyphicon-resize-vertical',
        'glyphicon-retweet',
        'glyphicon-road',
        'glyphicon-save',
        'glyphicon-saved',
        'glyphicon-screenshot',
        'glyphicon-sd-video',
        'glyphicon-search',
        'glyphicon-send',
        'glyphicon-share',
        'glyphicon-share-alt',
        'glyphicon-shopping-cart',
        'glyphicon-signal',
        'glyphicon-sort',
        'glyphicon-sort-by-alphabet',
        'glyphicon-sort-by-alphabet-alt',
        'glyphicon-sort-by-attributes',
        'glyphicon-sort-by-attributes-alt',
        'glyphicon-sort-by-order',
        'glyphicon-sort-by-order-alt',
        'glyphicon-sound-5-1',
        'glyphicon-sound-6-1',
        'glyphicon-sound-7-1',
        'glyphicon-sound-dolby',
        'glyphicon-sound-stereo',
        'glyphicon-star',
        'glyphicon-star-empty',
        'glyphicon-stats',
        'glyphicon-step-backward',
        'glyphicon-step-forward',
        'glyphicon-stop',
        'glyphicon-subtitles',
        'glyphicon-tag',
        'glyphicon-tags',
        'glyphicon-tasks',
        'glyphicon-text-height',
        'glyphicon-text-width',
        'glyphicon-th',
        'glyphicon-th-large',
        'glyphicon-th-list',
        'glyphicon-thumbs-down',
        'glyphicon-thumbs-up',
        'glyphicon-time',
        'glyphicon-tint',
        'glyphicon-tower',
        'glyphicon-transfer',
        'glyphicon-trash',
        'glyphicon-tree-conifer',
        'glyphicon-tree-deciduous',
        'glyphicon-unchecked',
        'glyphicon-upload',
        'glyphicon-usd',
        'glyphicon-user',
        'glyphicon-volume-down',
        'glyphicon-volume-off',
        'glyphicon-volume-up',
        'glyphicon-warning-sign',
        'glyphicon-wrench',
        'glyphicon-zoom-in',
        'glyphicon-zoom-out',
    ];

    var length = icons.length;
    var rows = 3;
    var cols = 4;

    var target = $('button[role="iconpicker"]').html('');

    var input = $('<input type="hidden"></input>')

    var span = $('<span></span>');

    target.append(span).append(input).append('<span class="caret"></span>');

    target.data('page', 1);

    var updateNav = function(page){

        var total_pages = Math.ceil( length / (cols * rows) );

        table.find('.page-count').html(page + ' / ' + total_pages);

        if(page == 1){
            table.find('.btn-previous').addClass('disabled');
        }
        else{
            table.find('.btn-previous').removeClass('disabled');
        }

        if(page == total_pages){
            table.find('.btn-next').addClass('disabled');
        }
        else{
            table.find('.btn-next').removeClass('disabled');
        }
    };


    var table = $('<table class="table-icons"><thead></thead><tbody></tbody></table>');

    var tr = $('<tr></tr>');
    for(var i=0; i<cols; i++){
        var btn = $('<button class="btn btn-primary"><span class="glyphicon"></span></button>');
        var td = $('<td class="text-center"></td>');
        if(i == 0 || i == cols - 1){
            btn.val((i==0) ? -1: 1);
            btn.addClass((i==0) ? 'btn-previous': 'btn-next');
            btn.find('span').addClass((i==0) ? 'glyphicon-arrow-left': 'glyphicon-arrow-right');
            td.append(btn);
            tr.append(td);
        }
        else if(tr.find('.page-count').length == 0){
            td.attr('colspan', cols-2).append('<span class="page-count"></span>');
            tr.append(td);
        }
    }
    table.find('thead').append(tr);

    var bindEvents = function(){
        table.find('.btn-previous, .btn-next').off('click').on('click', function(){
            //console.log(this);
            var page = parseInt(target.data('page'));
            var inc = parseInt($(this).val());
            changeList(page+inc);
        });
        table.find('.btn-icon').off('click').on('click', function(){
            //console.log(this);
            select($(this).val());
        });
    }




    updateNav(1);

    var selected = -1;

    var select = function(icon){
        //console.log(icon);
        selected = $.inArray(icon, icons);
        if(icon != '' && selected >= 0){
            target.data('icon', icon);
            input.val(icon);
            span.attr('class', '').addClass('glyphicon').addClass(icon);
            table.find('button.btn-warning').removeClass('btn-warning');

            target.popover('hide');
        }
    }

    var switchPage = function(icon){
        //console.log(icon);



        selected = $.inArray(icon, icons);
        if(icon != '' && selected >= 0){
            var page = (selected != 0) ? Math.ceil( selected / (cols * rows) ) : 1;
            //
            changeList(page);
        }

        table.find('.'+icon).parent().addClass('btn-warning');
    }

    var changeList = function(page){
        page = parseInt(page);
        updateNav(page);

        var tbody = table.find('tbody').empty();
        var offset = (page - 1) * rows * cols;
        for(var i=0; i<rows; i++){
            var tr = $('<tr></tr>');
            for(var j=0; j<cols; j++){
                var pos = offset+(i*cols)+j;
                //console.log(offset+'--'+i+'---'+rows+'---'+j+'---'+cols);
                var btn = $('<button class="btn btn-default btn-icon"></button>').hide();
                if(pos < length){
                    btn = $('<button class="btn btn-default btn-icon" value="' + icons[pos] + '"><span class="glyphicon ' + icons[pos] + '"></span></button>');
                }
                var td = $('<td></td>').append(btn);
                tr.append(td);
            }
            tbody.append(tr);
        }

        target.data('page', page);

        bindEvents();
    }

    changeList(1);

    target.popover({
        //trigger: 'hover',
        //title: 'X',
        html: true,
        content: table,
    }).on('shown.bs.popover', function () {
        //console.log('show.bs.popover');
        switchPage(target.data('icon'));
        bindEvents();
    })

    select(target.data('icon'));

});