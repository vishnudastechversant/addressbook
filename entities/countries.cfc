component persistent="true"  entityname="countries" table="tbl_countries" {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="sortName" column="sortname" ormtype="string";
    property name="name" column="name" ormtype="string";
}