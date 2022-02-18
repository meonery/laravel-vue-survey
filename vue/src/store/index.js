import {createStore} from "vuex";
import axiosClient from "../axios";

const tmpSurveys = [
    {
        id: 100,
        title: "TheCodeholic tutorial",
        slug: "thecodeholic-tutorial",
        status: "draft",
        image: "https://pbs.twimg.com/profile_images/1118059535003017221/9ZwEYqj2_400x400.png",
        description: "My name is Ashlynn.<br>I am a Web Developer with 3 years of experience",
        created_at: "2022-12-20 18:00:00",
        updated_at: "2022-12-20 18:00:00",
        expire_at: "2022-12-31 18:00:00",
        questions: [
            {
                id: 1,
                type: "select",
                question: "From which country are you?",
                description: null,
                data: {
                    options: [
                        {
                            uuid: "f8af96f2", text: "USA"
                        },
                        {
                            uuid: "201c1ff5", text: "Georgia"
                        },
                        {
                            uuid: "b5c09733", text: "Germany"
                        },
                        {
                            uuid: "2abf1cee", text: "India"
                        },
                        {
                            uuid: "8d14341b", text: "United Kingdom"
                        },
                    ]
                },
            },
            {
                id: 2,
                type: "checkbox",
                question: "Which language videos do you want to see on my channel?",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                data: {
                    options: [
                        {
                            uuid: "f8af96f2", text: "Javascript"
                        },
                        {
                            uuid: "201c1ff5", text: "PHP"
                        },
                        {
                            uuid: "b5c09733", text: "HTML + CSS"
                        },
                        {
                            uuid: "2abf1cee", text: "All of the Above"
                        },
                        {
                            uuid: "8d14341b", text: "Everything you think will be good"
                        },
                    ]
                },
            },
            {
                id: 3,
                type: "checkbox",
                question: "Which PHP framework videos do you want to see on my channel?",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                data: {
                    options: [
                        {
                            uuid: "f8af96f2", text: "Laravel"
                        },
                        {
                            uuid: "201c1ff5", text: "Yii2"
                        },
                        {
                            uuid: "b5c09733", text: "Codeigniter"
                        },
                        {
                            uuid: "2abf1cee", text: "Symfony"
                        },
                        
                    ]
                },
            },
            {
                id: 4,
                type: "radio",
                question: "Which Laravel framework do you love most?",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                data: {
                    options: [
                        {
                            uuid: "31132230", text: "Laravel 5"
                        },
                        {
                            uuid: "0ab53401", text: "Laravel 6"
                        },
                        {
                            uuid: "748fbsa4", text: "Laravel 7"
                        },
                        {
                            uuid: "f189hYjk", text: "Laravel 8"
                        },
                        
                    ]
                },
            },
            {
                id: 5,
                type: "checkbox",
                question: "What type of projects do you want to see on my channel built with Laravel?",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                data: {
                    options: [
                        {
                            uuid: "f8af96f2", text: "REST API"
                        },
                        {
                            uuid: "201c1ff5", text: "Ecommerce"
                        },
                        {
                            uuid: "b5c09733", text: "Real Estate"
                        },
                        {
                            uuid: "2abf1cee", text: "All of the Above"
                        },
                        
                    ]
                },
            },
            {
                id: 6,
                type: "text",
                question: "What's your favorite youtube channel?",
                description: null,
                data: {},
            },
            {
                id: 7,
                type: "textarea",
                question: "What do you think about TheCodeholic channel?",
                description: "Write your honest opinion. Everything is anonymous.",
                data: {},
            },
            

        ],
    },
    {
        id: 200,
        title: "Laravel 8",
        slug: "laravel-8",
        status: "active",
        image: "https://upload.wikimedia.org/wikipedia/commons/9/9a/Laravel.svg",
        description: `Laravel is a web application framework with expressive, elegant syntax.`,
        created_at: "2021-12-20 18:00:00",
        updated_at: "2021-12-20 18:00:00",
        expire_date: "2021-12-31 18:00:00",
        questions: [],
    },
    {
        id: 300,
        title: "Vue 3",
        slug: "vue-3",
        status: "active",
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/1184px-Vue.png",
        description: `Vue (pronounced /vjuː/, like view) is a progressive framework for building user interfaces.`,
        created_at: "2021-12-21 17:00:00",
        updated_at: "2021-12-21 17:00:00",
        expire_date: "2021-12-31 00:00:00",
        questions: [],
    },
    {
        id: 400,
        title: "Tailwind 3",
        slug: "tailwind-3",
        status: "active",
        image: "http://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/2048px-Tailwind.png",
        description: `A utility-first CSS framework for rapidly building custom user interfaces`,
        created_at: "2021-12-21 17:00:00",
        updated_at: "2021-12-21 17:00:00",
        expire_date: "2021-12-31 00:00:00",
        questions: [],
    }
    
    
];
const store = createStore({
    state: {
        user: {
            data: {},
            token: sessionStorage.getItem("TOKEN"),
        },
        currentSurvey: {
            loading: false,
            data: {}
        },
        surveys: [...tmpSurveys],
        questionTypes:["text", "select", "radio", "checkbox", "textarea"],
    },
    getters: {},
    actions: {
        getSurvey({ commit }, id){
            commit("setCurrentSurveyLoading", true);
        },
        saveSurvey({ commit, }, survey){
            delete survey.image_url;
            let response;
            if (survey.id){
                response = axiosClient
                    .put(`/survey/${survey.id}`, survey)
                    .then((res)=> {
                        commit("updateSurvey", res.data);
                        return res;
                    });
            } else {
                response = axiosClient.post("/survey", survey).then((res) => {
                    commit("saveSurvey", res.data);
                    return res;
                });
                    
            }
            return response;
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
        saveSurvey: (state, survey) => {
            state.surveys = [...state.surveys, survey.data];
        },
        updateSurvey: (state, survey) => {
            state.surveys = state.surveys.map((s)=> {
                if(s.id == survey.id){
                    return survey.data;
                }
                return s;
            });
        },
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
    },
    modules: {}
})

export default store;