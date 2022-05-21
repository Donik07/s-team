import * as Vue from "vue"
const point = "#point"
const element = document.querySelector(point)
if (element !== null) {
    const app = Vue.createApp({
        data() {
            return { count: 1 }
        },
        created() {
            console.log("count is: "+ this.count) // => "count is: 1"
        }
    })
    const vm = app.mount(point)
}