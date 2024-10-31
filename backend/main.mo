import Func "mo:base/Func";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

import Array "mo:base/Array";
import Time "mo:base/Time";
import List "mo:base/List";

actor {
  // Define the Post type
  public type Post = {
    id: Nat;
    title: Text;
    body: Text;
    author: Text;
    timestamp: Int;
  };

  // Store posts in a stable variable
  stable var posts : List.List<Post> = List.nil();
  stable var nextId : Nat = 0;

  // Function to add a new post
  public func addPost(title: Text, body: Text, author: Text) : async Nat {
    let id = nextId;
    nextId += 1;
    let post : Post = {
      id;
      title;
      body;
      author;
      timestamp = Time.now();
    };
    posts := List.push(post, posts);
    id
  };

  // Function to get all posts
  public query func getPosts() : async [Post] {
    List.toArray(posts)
  };
}
