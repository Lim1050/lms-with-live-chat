<template>
    <div>
        <!-- Button trigger modal -->
        <button
            type="button"
            class="btn btn-danger"
            data-toggle="modal"
            data-target="#exampleModal"
        >
            Chat Now!
        </button>

        <!-- Modal -->
        <div
            class="modal fade"
            id="exampleModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            Chat With Instructor
                        </h5>
                        <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="">
                        <div class="modal-body">
                            <textarea
                                class="form-control"
                                rows="3"
                                placeholder="Type your message..."
                                id=""
                            ></textarea>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">
                            Send Message
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
