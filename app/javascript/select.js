// import TomSelect from 'tom-select/dist/js/tom-select.popular'
//
// document.addEventListener("turbolinks:load", function() {
//     document.querySelectorAll('.js-multiple-select').forEach((element) => {
//         let opts = {
//             valueField: 'id',
//             labelField: 'name',
//             searchField: 'name',
//             create: false,
//             load: function(query, callback) {
//                 const url = element.dataset.ajaxUrl + '.json?term=' + encodeURIComponent(query)
//
//                 fetch(url)
//                     .then(response => response.json())
//                     .then (json => {
//                         callback(json)
//                     }).catch(() => {
//                     callback()
//                 })
//             }
//         }
//
//         new TomSelect(element, opts)
//     })
// })

// alert(123)