component persistent="true"  entityname="title" table="title" {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="name" column="name" ormtype="string";
}