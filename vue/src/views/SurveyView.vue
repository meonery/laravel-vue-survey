<template>
    <PageComponent>
       <template v-slot:header>
           <div class="flex items-center justify-between">
               <h1 class="text-3xl font-bold text-gray-900">
                   {{ route.params.id ? model.title : "Create a Survey"}}
               </h1>

                <button
                    v-if="route.params.id"
                    type="button"
                    class="py-2 px-3 text-white bg-red-500 rounded-md hover:bg-red-700"
                    @click="deleteSurvey()"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 -mt-1 inline-block text-white mr-3" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
                    </svg>
                   
                    Delete Survey

               </button>
           </div>
       </template>
       <div v-if="surveyLoading" class="flex justify-center">
           Loading...
       </div>
       
       <form v-else @submit.prevent="saveSurvey" class="animate-fade-in-down">
           <div class="shadow sm:rounded-md sm:overflow-hidden">
               <!-- Survey Fields -->
               
               <div class="px-4 py-5 bg-white space-y-6 sm:p-6">
                   
                   <!-- Image -->
                    <div>
                        <label class=" block text-sm font-medium text-gray-700">
                            Image
                        </label>
                        <div class="mt-1 flex items-center">
                            <img
                                v-if="model.image_url"
                                :src="model.image_url"
                                :alt="model.title"
                                class="w-64 h-48 object-cover"
                            />
                            <span 
                                v-else
                                class="flex items-center justify-center h-12 w-12 rounded-full overflow-hidden bg-gray-100">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-[80%] w-[80%] text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd" />
                                </svg>
                                
                            </span>
                            <button
                                type="button"
                                class="
                                    relative
                                    overflow-hidden
                                    ml-5
                                    bg-white
                                    py-2
                                    px-3
                                    border border-gray-300
                                    rounded-md
                                    shadow-sm
                                    text-sm
                                    leading-4
                                    font-medium
                                    text-gray-700
                                    hover:bg-gray-50
                                    focus:outline-none
                                    focus:ring-2
                                    focus:ring-offset-2
                                    focus:ring-indigo-500
                                "
                            >   
                                <input
                                    type="file"
                                    @change="onImageChoose"
                                    class="absolute left-0 top-0 right-0 bottom-0 opacity-0 cursor-pointer"
                                />
                                Change
                            </button>
                        </div>
                    </div>
                   <!--/ Image -->

                  

                    <div v-if="errorMsg" class="flex items-center justify-between py-3 px-5 bg-red-500 text-white rounded">
                        <p class="text-sm" v-html="errorMsg"></p>
                        <span @click="errorMsg = ''" class="w-6 h-6 cursor-pointer flex items-center justify-center rounded-full transition-colors hover:bg-[rgba(0,0,0,0.2)]">
                            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                            </svg>
                        </span>
                    </div>
                    
                    <!-- Title -->
                    <div>

                        <label for="title" class="block text-sm font-medium text-gray-700" >
                            Title
                        </label>
                        <input
                            type="text"
                            name="title"
                            id="title"
                            v-model="model.title"
                            autocomplete="survey_title"
                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                        />
                    </div>
                   <!--/ Title -->

                   <!-- Description -->
                    <div>
                        <label for="about" class="block text-sm font-medium text-gray-700" >
                            Description
                        </label>
                        <div class="mt-1">
                            <textarea 
                                name="description" 
                                id="description" 
                                rows="3"
                                v-model="model.description"
                                autocomplete="survey_description"
                                class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 mt-1 block w-full sm:text-sm border border-gray-300 rounded-md"
                                placeholder="Describe your survey"
                                >

                            </textarea>
                        </div>
                    </div>
                   <!--/ Description -->

                   <!-- Expire Data -->
                    <div>
                        <label for="about" class="block text-sm font-medium text-gray-700" >
                            Expiry Date (must be date after tomorrow)
                        </label>
                        <input 
                            type="date" 
                            name="expire_date" 
                            id="expire_date"
                            v-model="model.expire_date"
                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" required=""
                        />
                    </div>
                   <!--/ Expire Data -->

                   <!-- Status -->
                    <div class="flex items-center">
                        <div class="flex items-center h-5">
                            <input 
                                type="checkbox" 
                                name="status" 
                                id="status"
                                v-model="model.status"
                                class="focus:ring-indigo-50 h-4 w-4 text-indigo-600 border-gray-300 rounded"
                            />
                        </div>
                        <div class="ml-3 text-sm">
                            <label for="status" class="font-medium text-gray-700">
                                Active
                            </label>
                        </div>
                    </div>
                   <!--/ Status -->
               </div>
               <!--/ Survey Fields -->
                <div class="px-4 py-5 bg-white space-y-6 sm:p-6">
                    <h3 class="text-2xl font-semibold flex items-center justify-between">
                        Questions 

                        <!-- Add new questions -->
                        <button
                            type="button"
                            @click="addQuestion()"
                            class="flex items-center text-sm py-1 px-4 rounded-sm text-white bg-gray-600 hover:bg-gray-700"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3 mr-2 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                            </svg>
                            Add Question
                        </button>
                    </h3>
                    <!-- / Add new question -->

                    <div v-if="!model.questions.length" class="text-center text-gray-600">
                        You don't have any questions created
                    </div>
                    <div v-for="(question, index) in model.questions" :key="question.id">
                        <QuestionEditor
                            :question="question"
                            :index="index"
                            @change="questionChange"
                            @addQuestion="addQuestion"
                            @deleteQuestion="deleteQuestion"
                        />
                    </div>
                </div>

                <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                   <button
                    type="submit"
                    class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                   >
                        Save
                   </button>
               </div>

           </div>
       </form>
    </PageComponent>
</template>

<script setup>
    import { v4 as uuidv4 } from 'uuid';
    import store from "../store";
    import { ref, watch, computed } from "vue";
    import { useRoute, useRouter } from "vue-router";

    import PageComponent from '../components/PageComponent.vue';
    import QuestionEditor from '../components/editor/QuestionEditor.vue';

    const router = useRouter();
    const route = useRoute();
    const surveyLoading = computed(() => store.state.currentSurvey.loading)
    let errorMsg = ref('');
    
    // Create empty survey
    let model = ref({
        title: "",
        status: false,
        description: null,
        image_url: null,
        expire_date: null,
        questions: [],
    });

    // Watch to current survey data change and when this happens we update local model
    watch(
        () => store.state.currentSurvey.data,
        (newVal, oldVal) => {
            model.value = {
                ...JSON.parse(JSON.stringify(newVal)),
                status: newVal.status !== "draft",
            };
        }
    );

    if (route.params.id) {
        store.dispatch('getSurvey', route.params.id);
    }

    function onImageChoose(ev){
        const file = ev.target.files[0];

        const reader = new FileReader();
        reader.onload = () => {
            // The filed to send on backend and apply validations
            model.value.image = reader.result;

            // The field to display
            model.value.image_url = reader.result;
        }
        reader.readAsDataURL(file);
    }

    function addQuestion(index){
        const newQuestion = {
            id: uuidv4(),
            type: "text",
            question: "",
            description: null,
            data: {}
        };
        model.value.questions.splice(index, 0, newQuestion);
    }

    function deleteQuestion(question) {
        model.value.questions = model.value.questions.filter(
            (q) => q !== question
        );
    }

    function questionChange(question) {
        model.value.questions = model.value.questions.map((q) => {
            if (q.id === question.id ) {
                return JSON.parse(JSON.stringify(question));
            }
            return q;
        });
    }
    function saveSurvey(){
        store
            .dispatch("saveSurvey", model.value)
            .then(({ data }) => {
                store.commit('notify', {
                    type: 'success',
                    message: 'Survey was successfully updated'
                })
                router.push({
                    name: "SurveyView",
                    params: { id: data.data.id }
                });
            }).catch(err => {
                errorMsg.value = err.response.data.message;
            });
    }

    function deleteSurvey(){
        if(
            confirm(`Are you sure you want to delete this survey? Operation can't be undone`)
        ){
            store.dispatch("deleteSurvey", model.value.id).then(() => {
                    router.push({
                        name: "Surveys",
                    });
                });

        }
    }
</script>

<style scoped>

</style>