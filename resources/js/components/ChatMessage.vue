<template>
    <div class="row">
        <div class="col-md-2 myUser">
            <ul class="user">
                <strong>Chat List</strong>
                <hr />
                <li v-for="(user, index) in users" :key="index">
                    <a href="" @click.prevent="userMessage(user.id)">
                        <img
                            v-if="user.role === 'user'"
                            :src="'/upload/user_images/' + user.photo"
                            alt="UserImage"
                            class="userImg"
                        />
                        <img
                            v-else
                            :src="'/upload/instructor_images/' + user.photo"
                            alt="UserImage"
                            class="userImg"
                        />
                        <span class="username text-center">{{
                            user.name
                        }}</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10" v-if="allmessages.user">
            <div class="card">
                <div class="card-header text-center myrow">
                    <strong> {{ allmessages.user.name }} </strong>
                </div>
                <div class="card-body chat-msg">
                    <ul
                        class="chat"
                        v-for="(message, index) in allmessages.messages"
                        :key="index"
                    >
                        <li
                            class="sender clearfix"
                            v-if="allmessages.user.id === message.sender_id"
                        >
                            <span class="chat-img left clearfix mx-2">
                                <img
                                    :src="
                                        '/upload/instructor_images/' +
                                        message.user.photo
                                    "
                                    class="userImg"
                                    alt="userImg"
                                />
                            </span>
                            <div class="chat-body2 clearfix">
                                <div class="header clearfix">
                                    <strong class="primary-font">{{
                                        message.user.name
                                    }}</strong>
                                    <small class="right font-color">
                                        {{ message.created_at }}
                                    </small>
                                    <!-- //if send with product id  -->
                                    <!-- <div class="text-center">
                                        product name
                                        <img
                                            src="/frontend/avatar-3.png"
                                            alt="productImg"
                                            width="60px;"
                                        />
                                    </div> -->
                                </div>

                                <p class="font-color">{{ message.message }}</p>
                            </div>
                        </li>

                        <!-- my part  -->
                        <li class="buyer clearfix">
                            <span
                                class="chat-img right clearfix mx-2"
                                v-if="
                                    allmessages.user.id === message.receiver_id
                                "
                            >
                                <img
                                    :src="
                                        '/upload/user_images/' +
                                        message.user.photo
                                    "
                                    class="userImg"
                                    alt="userImg"
                                />
                            </span>
                            <div class="chat-body clearfix">
                                <div class="header clearfix">
                                    <strong class="primary-font">{{
                                        message.user.name
                                    }}</strong>
                                    <small class="left font-color">{{
                                        message.created_at
                                    }}</small>
                                    <!-- <strong class="right primary-font">Myusername </strong> //my name   -->
                                    <!-- <div class="text-center">
                                        Product name
                                        <img
                                            src="/frontend/avatar-5.png"
                                            alt="prouductImage"
                                            width="60px;"
                                        />
                                    </div> -->
                                </div>
                                <p class="font-color">{{ message.message }}</p>
                            </div>
                        </li>

                        <li class="sender clearfix">
                            <span class="chat-img left clearfix mx-2"> </span>
                        </li>
                    </ul>
                </div>
                <div class="card-footer">
                    <div class="input-group">
                        <input
                            id="btn-input"
                            type="text"
                            v-model="message"
                            class="form-control input-sm"
                            placeholder="Type your message here..."
                        />
                        <span class="input-group-btn">
                            <button
                                class="btn btn-primary"
                                @click.prevent="sendMessage()"
                            >
                                Send
                            </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            users: {},
            allmessages: {},
            selectedUser: "",
            message: "",
        };
    },

    created() {
        this.getAllUser();
    },

    methods: {
        getAllUser() {
            axios
                .get("/user-all")
                .then((response) => {
                    this.users = response.data;
                })
                .catch((error) => {});
        },

        userMessage(userId) {
            axios
                .get("/user-message/" + userId)
                .then((response) => {
                    this.allmessages = response.data;
                    this.selectedUser = userId;
                })
                .catch((error) => {});
        },

        sendMessage() {
            axios
                .post("/send-message", {
                    receiver_id: this.selectedUser,
                    message: this.message,
                })
                .then((response) => {
                    this.message = "";
                    this.userMessage(this.selectedUser);
                    console.log(response.data);
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                });
        },
    },
};
</script>

<style>
.username {
    color: #000;
}

.myrow {
    background: #f3f3f3;
    padding: 25px;
}

.myUser {
    padding-top: 30px;
    overflow-y: scroll;
    height: 450px;
    background: #f2f6fa;
}
.user li {
    list-style: none;
    margin-top: 20px;
}

.user li a:hover {
    text-decoration: none;
    color: red;
}
.userImg {
    height: 35px;
    border-radius: 50%;
}
.chat {
    list-style: none;
    margin: 0;
    padding: 0;
}

.chat li {
    margin-bottom: 40px;
    padding-bottom: 5px;
    margin-top: 20px;
    width: 80%;
    height: 10px;
}

.chat li .chat-body p {
    margin: 0;
}

.chat-msg {
    overflow-y: scroll;
    height: 350px;
    background: #f2f6fa;
}
.chat-msg .chat-img {
    width: 100px;
    height: 100px;
}
.chat-msg .img-circle {
    border-radius: 50%;
}
.chat-msg .chat-img {
    display: inline-block;
}
.chat-msg .chat-body {
    display: inline-block;
    max-width: 45%;
    margin-right: -73px;
    background-color: #498641;
    border-radius: 12.5px;
    padding: 15px;
}
.chat-msg .chat-body2 {
    display: inline-block;
    max-width: 80%;
    margin-left: -64px;
    background-color: #444444;
    border-radius: 12.5px;
    padding: 15px;
}
.chat-msg .chat-body strong {
    color: #dfe3e7;
}

.chat-msg .buyer {
    text-align: right;
    float: right;
}
.chat-msg .buyer p {
    text-align: left;
}
.chat-msg .sender {
    text-align: left;
    float: left;
}
.chat-msg .left {
    float: left;
}
.chat-msg .right {
    float: right;
}

.clearfix {
    clear: both;
}
.font-color {
    color: #ffffff;
}
</style>
