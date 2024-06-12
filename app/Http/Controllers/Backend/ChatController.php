<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\ChatMessage;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    public function SendMessage(Request $request)
    {
        $request->validate([
            'message' => 'required'
        ]);

        ChatMessage::create([
            'sender_id' => Auth::user()->id,
            'receiver_id' => $request->receiver_id,
            'message' => $request->message,
            'created_at' => Carbon::now()
        ]);

        return response()->json(['message' => 'Message Send Successfully!']);
    }

    public function GetAllUsers()
    {
        $chats = ChatMessage::orderBy('id', 'DESC')
            ->where('sender_id', auth()->id())
            ->orwhere('receiver_id', auth()->id())
            ->get();

        $users = $chats->flatMap(function ($chat) {
            if ($chat->sender_id === auth()->id()) {
                return [$chat->sender, $chat->receiver];
            }
            return [$chat->receiver, $chat->sender];
        })->unique();
        return $users;
    }
}
