(function ($) {
    $.fn.countTo = function (opts) {
        var options = $.extend({}, $.fn.countTo.defaults, opts);
        return $(this).each(function () {
            var _this = this, originalData = $(this).text(), loops = Math.ceil(options.speed / options.refreshInterval),
                increment = ($(this).text() - options.from) / loops, loopCount = 0, value = options.from,
                interval = setInterval(updateTimer, options.refreshInterval);

            function updateTimer() {
                value += increment;
                loopCount++;
                var str = value.toFixed(options.decimals);
                this.sizeNum = str.length;
                this.sizeNumBefore = this.sizeNum - options.decimals - 1;
                if (this.sizeNumBefore >= options.beforeSize) {
                    $(_this).html(str + options.lastSymbol);
                } else {
                    this._str = Array(options.beforeSize - this.sizeNumBefore + 1).join('0') + str;
                    $(_this).html(this._str + options.lastSymbol);
                }
                if (typeof(options.onUpdate) == 'function') {
                    options.onUpdate.call(_this, value, loopCount);
                }
                if (loopCount >= loops) {
                    clearInterval(interval);
                    $(_this).html(originalData + options.lastSymbol);
                    value = $(_this).text();
                    if (typeof(options.onComplete) == 'function') {
                        options.onComplete(value, loopCount, _this);
                    }
                }
            }
        });
    };
    $.fn.countTo.defaults = {
        lastSymbol: "%",
        from: 0,
        speed: 1000,
        refreshInterval: 100,
        beforeSize: 0,
        decimals: 0,
        onUpdate: null,
        onComplete: null
    };
})(jQuery);