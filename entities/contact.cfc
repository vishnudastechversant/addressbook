component persistent="true" entityname="contact" table="contact"  {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="title" column="title" ormtype="int";
    property name="firstName" column="first_name" ormtype="string";
    property name="lastName" column="last_name" ormtype="string";
    property name="email" column="email" ormtype="string";
    property name="address" column="address" ormtype="string";
    property name="phone" column="phone" ormtype="string";
    property name="photo" column="photo" ormtype="string";
    property name="gender" column="gender" ormtype="int";
    property name="dob" column="dob" ormtype="date";
    property name="city" column="city" ormtype="int";
    property name="state" column="state" ormtype="int";
    property name="country" column="country" ormtype="int";
    property name="pincode" column="pincode" ormtype="int";
    property name="userCreated" column="user_created" ormtype="int";

    function getName() {
        return uCase( firstName & ' ' & lastName );
    }

    function getTitleData(){
        return entityLoadByPK("title", title)
    }

    function getGenderData(){
        return entityLoadByPK("gender", gender)
    }

    function getCityData(){
        return entityLoadByPK("cities", city)
    }

    function getStateData(){
        return entityLoadByPK("states", state)
    }

    function getCountryData(){
        return entityLoadByPK("countries", country)
    }
}