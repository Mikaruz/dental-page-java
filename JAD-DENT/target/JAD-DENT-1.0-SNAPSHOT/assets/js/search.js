(function (document) {
  "buscador";
  var LightTableFilter = (function (Arr) {
    
    var _input;
    
    function _onInputEvent(e) {
      _input = e.target;
      console.log(_input);
      var tables = document.getElementsByClassName(
        _input.getAttribute("data-table")
      );
      Arr.forEach.call(tables, function (table) {
        Arr.forEach.call(table.tBodies, function (tbody) {
          Arr.forEach.call(tbody.rows, _filter);
        });
      });
    }

    function _filter(row) {
      var text = row.textContent.toLowerCase(),
        val = _input.value.toLowerCase();
      row.style.display = text.indexOf(val) === -1 ? "none" : "table-row";
    }

    return {
      init: function () {
        var inputs = document.getElementsByClassName("w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input");
        Arr.forEach.call(inputs, function (input) {
          input.oninput = _onInputEvent;
        });
      },
    };
  })(Array.prototype);

  document.addEventListener("readystatechange", function () {
    if (document.readyState === "complete") {
      LightTableFilter.init();
    }
  });
})(document);
