import axios from "axios";
import {createStore} from "vuex";
import axiosClient from "../axios";

// const tmpSurveys = [
//     {
//         id: 100,
//         title: "TheCodeholic tutorial",
//         slug: "thecodeholic-tutorial",
//         status: "draft",
//         image: "https://pbs.twimg.com/profile_images/1118059535003017221/9ZwEYqj2_400x400.png",
//         description: "My name is Ashlynn.<br>I am a Web Developer with 3 years of experience",
//         created_at: "2022-12-20 18:00:00",
//         updated_at: "2022-12-20 18:00:00",
//         expire_at: "2022-12-31 18:00:00",
//         questions: [
//             {
//                 id: 1,
//                 type: "select",
//                 question: "From which country are you?",
//                 description: null,
//                  data: {options: [{uuid: "f8af96f2", text: "USA"},{uuid: "201c1ff5", text: "Georgia"},{uuid: "b5c09733", text: "Germany"},{uuid: "2abf1cee", text: "India" },{uuid: "8d14341b", text: "United Kingdom"}]}
//             },
//             {
//                 id: 2,
//                 type: "checkbox",
//                 question: "Which language videos do you want to see on my channel?",
//                 description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                 data: {options: [{uuid: "f8af96f2", text: "Javascript"},{uuid: "201c1ff5", text: "PHP"},{uuid: "b5c09733", text: "HTML + CSS"},{uuid: "2abf1cee", text: "All of the Above"},{uuid: "8d14341b", text: "Everything you think will be good"}]}
//             },
//             {
//                 id: 3,
//                 type: "checkbox",
//                 question: "Which PHP framework videos do you want to see on my channel?",
//                 description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                 data: {options: [{uuid: "f8af96f2", text: "Laravel"},{uuid: "201c1ff5", text: "Yii2"},{uuid: "b5c09733", text: "Codeigniter"},{uuid: "2abf1cee", text: "Symfony"}]},
//             },
//             {
//                 id: 4,
//                 type: "radio",
//                 question: "Which Laravel framework do you love most?",
//                 description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                 data: {options: [{uuid: "31132230", text: "Laravel 5"},{uuid: "0ab53401", text: "Laravel 6"},{uuid: "748fbsa4", text: "Laravel 7"},{uuid: "f189hYjk", text: "Laravel 8"}]},
//             },
//             {
//                 id: 5,
//                 type: "checkbox",
//                 question: "What type of projects do you want to see on my channel built with Laravel?",
//                 description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                 data: {options: [{uuid: "f8af96f2", text: "REST API"},{uuid: "201c1ff5", text: "Ecommerce"},{uuid: "b5c09733", text: "Real Estate"},{uuid: "2abf1cee", text: "All of the Above"}]},
//             },
//             {
//                 id: 6,
//                 type: "text",
//                 question: "What's your favorite youtube channel?",
//                 description: null,
//                 data: {},
//             },
//             {
//                 id: 7,
//                 type: "textarea",
//                 question: "What do you think about TheCodeholic channel?",
//                 description: "Write your honest opinion. Everything is anonymous.",
//                 data: {},
//             },
            

//         ],
//     },
//     {
//         id: 200,
//         title: "Laravel 8",
//         slug: "laravel-8",
//         status: "active",
//         image: "https://upload.wikimedia.org/wikipedia/commons/9/9a/Laravel.svg",
//         description: `Laravel is a web application framework with expressive, elegant syntax.`,
//         created_at: "2021-12-20 18:00:00",
//         updated_at: "2021-12-20 18:00:00",
//         expire_date: "2021-12-31 18:00:00",
//         questions: [],
//     },
//     {
//         id: 300,
//         title: "Vue 3",
//         slug: "vue-3",
//         status: "active",
//         image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/1184px-Vue.png",
//         description: `Vue (pronounced /vjuː/, like view) is a progressive framework for building user interfaces.`,
//         created_at: "2021-12-21 17:00:00",
//         updated_at: "2021-12-21 17:00:00",
//         expire_date: "2021-12-31 00:00:00",
//         questions: [],
//     },
//     {
//         id: 400,
//         title: "Tailwind 3",
//         slug: "tailwind-3",
//         status: "active",
//         image: "http://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/2048px-Tailwind.png",
//         description: `A utility-first CSS framework for rapidly building custom user interfaces`,
//         created_at: "2021-12-21 17:00:00",
//         updated_at: "2021-12-21 17:00:00",
//         expire_date: "2021-12-31 00:00:00",
//         questions: [],
//     }
    
    
// ];
const store = createStore({
    state: {
        user: {
            data: {},
            
            token: sessionStorage.getItem("TOKEN"),
        },
        dashboard: {
            loading: false,
            data: {}
        },
        currentSurvey: {
            loading: false,
            data: {}
        },
        surveys: {
            loading: false,
            links: [],
            data:[]
        },
        questionTypes:["text", "select", "radio", "checkbox", "textarea"],
        notification: {
            show: false,
            message: null,
            type:null,
        }
    },
    getters: {},
    actions: {
        getDashboardData({commit}){
             commit('dashboardLoading', true)
             return axiosClient
                .get(`/dashboard`)
                .then((res)=> {
                    commit('dashboardLoading', false)
                    commit('setDashboardData', res.data)
                    return res;
                })
                .catch(error => {
                    commit('dashboardLoading', false)
                    return error; 
                })
        },
        getSurvey({ commit }, id){
            commit("setCurrentSurveyLoading", true);
            return axiosClient
                .get(`/survey/${id}`)
                .then((res) => {
                    commit("setCurrentSurvey", res.data);
                    commit("setCurrentSurveyLoading", false);
                    return res;
                })
                .catch((err) =>{
                    commit("setCurrentSurveyLoading", false);
                    throw err;
                });
        },
        saveSurvey({ commit }, survey){
            delete survey.image_url;
            let response;
            if (survey.id){
                response = axiosClient
                    .put(`/survey/${survey.id}`, survey)
                    .then((res)=> {
                        commit("setCurrentSurvey", res.data);
                        return res;
                    });
            } else {
                response = axiosClient.post("/survey", survey).then((res) => {
                    commit("setCurrentSurvey", res.data);
                    return res;
                });
                    
            }
            return response;
        },
        deleteSurvey({}, id){
            return axiosClient.delete(`/survey/${id}`);
        },
        getSurveys({ commit }, { url = null} = {}){
            url = url || '/survey'
            commit('setSurveysLoading', true)
            return axiosClient.get(url).then((res) => {
                commit('setSurveysLoading', false)
                commit('setSurveys', res.data);
                return res;
            })
        },
        getSurveyBySlug({ commit }, slug){
            commit("setCurrentSurveyLoading", true);
            return axiosClient
                .get(`/survey-by-slug/${slug}`)
                .then((res) => {
                    commit("setCurrentSurvey", res.data);
                    commit("setCurrentSurveyLoading",false);
                    return false;
                })
                .catch((err) =>{
                    commit("setCurrentSurveyLoading", false);
                    throw err;
                });
        },
        saveSurveyAnswers({ commit }, {surveyId, answers}){
            return axiosClient.post(`/survey/${surveyId}/answer`, {answers});
        },
        register({ commit }, user){
            return axiosClient.post('/register', user)
            .then(({data}) => {
                commit('setUser', data);
                return data;
            })
        },
        login({ commit }, user){
            return axiosClient.post('/login', user)
            .then(({data}) => {
                commit('setUser', data);
                return data;
            })
                
        },
        logout({ commit }){
            return axiosClient.post('/logout')
            .then(response => {
                commit('logout')
                return response;
            })
        }
    },
    mutations: {
        dashboardLoading: (state, loading) =>{
            state.dashboard.loading = loading;
        },
        setDashboardData: (state, data) =>{
            state.dashboard.data = data;
        },
        setCurrentSurveyLoading: (state, loading) => {
            state.currentSurvey.loading = loading;
        },
        setSurveysLoading: (state, loading) => {
            state.surveys.loading = loading;
        },
        setCurrentSurvey: (state, survey) => {
            state.currentSurvey.data = survey.data;
        },
        setSurveys: (state, surveys) => {
            state.surveys.links = surveys.meta.links;
            state.surveys.data = surveys.data;
        },

        // saveSurvey: (state, survey) => {
        //     state.surveys = [...state.surveys, survey.data];
        // },
        // updateSurvey: (state, survey) => {
        //     state.surveys = state.surveys.map((s)=> {
        //         if(s.id == survey.id){
        //             return survey.data;
        //         }
        //         return s;
        //     });
        // },
        logout: (state) => {
            state.user.token = null;
            state.user.data = {};
            sessionStorage.removeItem('TOKEN');
        },
        setUser: (state, userData) => {
            state.user.token = userData.token;
            state.user.data = userData.user;
            sessionStorage.setItem('TOKEN', userData.token); 
        },
        notify: (state, {message, type}) => {
            state.notification.show = true;
            state.notification.type = type;
            state.notification.message = message;
            setTimeout(()=> {
                state.notification.show = false;
            }, 3000)
        }
    },
    modules: {}
})

export default store;