component persistent="true"  {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="title" column="title" ormtype="string";
    property name="firstName" column="first_name" ormtype="string";
    property name="lastName" column="last_name" ormtype="string";
    property name="phone" column="phone" ormtype="string" notnull="true";
    property name="profileImage" column="profile_img" ormtype="string" notnull="true";
    property name="gender" column="created_at" ormtype="date" notnull="true";
    property name="updatedAt" column="updatedAt" ormtype="date" notnull="true";

    function getName() {
        return uCase( variables.firstName + ' ' + variables.lastName );
    }
}

// title
// gender
// dob
// photo 
// address 
// city 
// state 
// country
// pincode